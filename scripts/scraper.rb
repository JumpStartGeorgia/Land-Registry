#!/usr/bin/env ruby

APP_PATH = File.expand_path('../../config/application',  __FILE__)
require File.expand_path('../../config/boot',  __FILE__)
require APP_PATH
# set Rails.env here if desired
Rails.application.require_environment!

require 'typhoeus'
require 'nokogiri'
require 'fileutils'

@data_path = "../data/"
@log_path = "../log/"

@log = Logger.new("#{@log_path}scraper.log")
@start_time = Time.now


@log.info "*****************************************"
@log.info "** #{@start_time}"
@log.info "*****************************************"

# get start and end ids
def get_start_id
  start_id = 27141
end

def get_end_id
  end_id = 27241
end

# process request responses
def process_response(response)
  page = Nokogiri::HTML(response.body)
  
  # save raw page to disk
  filename = /\d+/.match(response.request.url).to_s
  path = @data_path + filename
  File.open(path, "w") { |f| f.write(page) }
  
  # get title
  title = page.css("#titletext").text.chomp
  
  # get body
  body = page.css("#maintext").text.chomp
  
  # write to database
  article = Article.new
  article.raw = page.inner_html
  article.title = title
  article.body = body
  article.save
end

# make page requests
def make_requests(ids)
  total_ids = ids.length
  @log.info "There are #{total_ids} records to process."

  # initialize hydra
  hydra = Typhoeus::Hydra.new(max_concurrency: 20)
  request = nil

  # build hydra queue
  ids.each do |i|
    url = "YOUR URL HERE"
    request = Typhoeus::Request.new(url, followlocation: true)
    
    request.on_complete do |response|
      if response.success?
        @log.info("#{response.request.url} - success")
        process_response(response)
      elsif response.timed_out?
        @log.warn("#{response.request.url} - got a time out")
      elsif response.code == 0
        @log.error("#{response.request.url} - no response: #{response.return_message}")
      else
        @log.error("#{response.request.url} - HTTP request failed: #{response.code.to_s}")
      end
    end
    hydra.queue request
  end
  
  hydra.run
end


start_id = get_start_id
end_id = get_end_id
make_requests((start_id..end_id).to_a)

