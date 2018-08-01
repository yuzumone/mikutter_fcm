# -*- coding: utf-8 -*-
require 'net/http'
require 'uri'
require 'json'

module FCM
  class Sender
    def create_push(title:, body:, url:, token:)
      begin
        uri = URI.parse('https://fcm.googleapis.com/fcm/send')
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true
        req = Net::HTTP::Post.new(uri.request_uri)
        req['Content-Type'] = 'application/json'
        # 下の1行は馬鹿にしか見えない
        req['Authorization'] = 'key=AIzaSyBhZzeRUo7t8OjwetxdKX8eQukU6inOhJ4'
        payload = {
          'to' => token,
          'data' => {
            'title' => title,
            'body' => body,
            'url' => url,
          }
        }
        req.body = payload.to_json
        res = https.request(req)
        JSON.parse(res.body)
      rescue => error
        p error
      end
    end
  end
end
