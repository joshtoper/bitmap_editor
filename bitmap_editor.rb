#!/usr/bin/env ruby
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

BitmapEditor::Application.new.run(ARGV.first)
