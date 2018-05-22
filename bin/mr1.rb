#!/usr/bin/ruby

require 'mongo'
require 'builder'
require 'optparse'
require_relative '../lib/connection'
require 'squid'
require 'prawn'
require 'rubygems'

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
reduce_count = "function(key, values) { " +
                "var sum = 0; " +
                "values.forEach(function(f) { " +
                " sum += f.count; " +
                "}); " +
                "return {count: sum};" +
        "};"
map = "function() { emit(this.district, {count: 1}); }"
reduce = reduce_count
results = alarms.find().map_reduce(map, reduce)
alarms = alarms.find( { description: description } );
results2 = alarms.map_reduce(map, reduce, query: { description: description })
s = results
s2 = results2

all_results=results.to_a
match_results=results2.to_a


aryall=Array.new
arymatch=Array.new
precentmatch=Array.new

all_results.each do |x|
  aryall.push([x[:_id],x[:value][:count]])
end

match_results.each do |x|
  arymatch.push([x[:_id],x[:value][:count]])
end

#p aryall
#p arymatch

arymatch.each do |x|
  aryall.each do |y|
    if x[0]==y[0]
      precentmatch.push([x[0],(x[1].to_f/y[1].to_f*100).round(2)])
    end
  end
end
sorted = precentmatch.sort { |x,y| x[1] <=> y[1] }
precentmatch = sorted

arr=[]
for i in 0..precentmatch.size()-1
  arr << precentmatch[i][0]
  arr << precentmatch[i][1]
end
h=Hash[*arr]

  Prawn::Document.generate("procent1.pdf") do
    data = {alarms: h}
    chart data
  end
