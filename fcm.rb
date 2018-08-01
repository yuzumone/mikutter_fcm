# -*- coding: utf-8 -*-

require_relative './sender'

Plugin.create(:fcm) do

  defevent :fcm, priority: :ui_passive, prototype: [Hash]

  on_fcm do |data|
    sender = FCM::Sender.new
    title = data[:title]
    body = data[:body]
    url = data[:url]
    sender.create_push title: title, body: body, url: url, token: UserConfig[:fcm_token]
  end

  settings "FCM" do
    input("Token", :fcm_token)
  end
end

