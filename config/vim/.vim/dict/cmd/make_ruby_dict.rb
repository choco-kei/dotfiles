#!/usr/local/bin/ruby

require 'uri'

if ARGV.size != 1
  warn "Invalid argument"
  exit
end

methods = []
Dir.glob(File.expand_path(ARGV[0]) + "/**/*.ri").each do |file|
  method = URI.decode(File.basename(file))
  if /^(.*)-\w*\.ri$/ =~ method
    methods << $1
  else
    warn file
  end
end

methods.uniq!.sort.each do |method|
  puts method
end
