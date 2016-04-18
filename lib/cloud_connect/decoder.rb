require "cloud_connect/decoder/version"
require "cloud_connect/track"
require "cloud_connect/message"
require "cloud_connect/field"
require "json"
require "base64"
require "time"

module CloudConnect
  module Decoder extend self
    def decode(raw_notification_str)
      data = JSON.parse raw_notification_str
      tracks,messages = [[],[]]
      data.each do |d|
        case d['meta']['event']
        when 'track'
          tracks << CloudConnect::Track.new(d['payload'])
        when 'message'
          messages << CloudConnect::Message.new(d['payload'])
        end
      end
      [tracks, messages]
    end
  end
end
