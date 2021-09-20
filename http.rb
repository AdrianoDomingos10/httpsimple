#!/usr/bin/ruby
require 'net/http'
class MyHead
def initialize(host,port = nil)
@host = host
@port = port.to_i || 80
end
def getHeader()
Net::HTTP.start(@host.to_s,@port) do |http|
resp = http.head('/')
return [resp['server'].to_s ,resp['x-powered-by'].to_s]
end
return [nil,nil]
end
end
if ARGV.size <= 0 || ARGV.size > 2
print "Usage: #{$0} Host [Port]\n"
exit
end
head = MyHead.new(ARGV[0],ARGV[1])
server, mods = head.getHeader()
print "Server #{server} (#{mods})\n"
