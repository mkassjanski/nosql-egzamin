#!/usr/bin/ruby

require 'mongo'
require 'builder'
require 'optparse'
require_relative '../lib/connection'
require 'squid'
require 'prawn'


options = {}
optparse = OptionParser.new do |opt|
  opt.on('-d', '--district symbol') { |o| options[:district] = o }
end

begin
  optparse.parse!
rescue OptionParser::MissingArgument
  puts "\nUse -d <symbol> to select description.\n"
end

if options[:description]
    description=options[:description]
else
  description="911/NO  VOICE"
end

conn = Connection.new
db = conn.client.database
alarms = conn.alarms

results2 = alarms.aggregate([
  {'$project' => {priority: 1,
    description: 1,
    callDateTime: DateTime.parse('$callDateTime')
          }}
  ])

k=results2
k.each do |x|
  p x
end
