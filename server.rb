#!/usr/bin/env ruby
require 'webrick'
require 'webrick/https'

port = 3000

config = {
  :BindAddress  => 'XXX.XXX.XXX.XXX',
  :Port         => port,
  :DocumentRoot => '.',
  :SSLEnable    => true,
  :SSLCertName  => [["CN", "devserver"]],
}

server = WEBrick::HTTPServer.new(config)
Signal.trap('INT') { server.shutdown }
server.start
