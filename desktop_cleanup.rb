#!/usr/bin/env ruby
#
# desktop_cleanup.rb
# Script to loop through desktop files and sort them
# Created By: Tyler Smith
# Date: November 10th, 2014
#
# Usage: sudo ruby desktop_cleanup.rb
#   Note: Sudo doesn't have to be used, but if a file is protected, script will crash due to permission error
#
# TODO: Add more sorting criteria for different destination folders
###


require 'fileutils'

DESKTOP_DIRECTORY = File.expand_path("~/Desktop")
SCREENSHOT_DIRECTORY = DESKTOP_DIRECTORY + "/Screenshots"
DESKTOP_DUMP_DIRECTORY = DESKTOP_DIRECTORY + "/Dump"

if !Dir.exist?(SCREENSHOT_DIRECTORY)
  FileUtils.mkdir(SCREENSHOT_DIRECTORY)
end

if !Dir.exist?(DESKTOP_DUMP_DIRECTORY)
  FileUtils.mkdir(DESKTOP_DUMP_DIRECTORY)
end

Dir.foreach(DESKTOP_DIRECTORY) do |item|
  next if item == '.' or item == '..'
  next if Dir.exists?("#{DESKTOP_DIRECTORY + '/' + item}")
  puts item


  if item.include?("Screen Shot") || item.include?("Screen shot") || item.include?("Screen_Shot")
    FileUtils.mv("#{DESKTOP_DIRECTORY + '/' + item}", SCREENSHOT_DIRECTORY)
  else
    FileUtils.mv("#{DESKTOP_DIRECTORY + '/' + item}", DESKTOP_DUMP_DIRECTORY)
  end
end