require 'socket'
require 'net/http'
require 'uri'

module RExtensions
  class Net
    
    def site_up?(site_url)
      uri = URI(site_url)
      TCPSocket.open(uri.host, uri.port) do |socket|
        socket.puts "HEAD #{uri.path} HTTP/1.1\r\nHOST: 127.0.0.1\r\n\r\n"
        status = socket.gets[/HTTP\/1\.1 (\d+) (.*)/, 1].to_i
        p status
        return (100..399) === status
      end
    rescue StandardError => error
      puts error
    end
    
    def internet_connection?
      test_site_url = 'http://google.com'
      uri = URI(test_site_url)
      begin 
        http = Net::HTTP.new(uri.host, uri.port) 
        http.open_timeout = 5
        http.start
        http.finish
        return true
      rescue Timeout::Error
        false
      end
    end
    
  end
end