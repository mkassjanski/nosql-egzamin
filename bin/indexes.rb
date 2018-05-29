#!/usr/bin/ruby

require 'mongo'
require_relative '../lib/connection'

conn = Connection.new
db = conn.client.database
alarms = conn.alarms


alarms.indexes.create_many([
  { :key => { "district" => 1 }, "text" => true },
  { :key => { "description" => 1 }, "multikey" => true }
])
