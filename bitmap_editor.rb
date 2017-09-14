#!/usr/bin/env ruby
Dir[File.expand_path(File.dirname(__FILE__) + "/lib/*.rb")].each { |file| require file }

BitmapEditor::Application.new.run(ARGV.first)
