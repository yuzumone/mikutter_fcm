# -*- coding: utf-8 -*-

require_relative './sender'

Plugin.create(:fcm) do

  defevent :fcm, priority: :ui_passive, prototype: [Hash]

  on_fcm do |data|
    case data
    when Hash
      send_fcm_from_hash(data)
    when Diva::Model
      send_fcm_from_model(data)
    end
  end

  def send_fcm_from_hash(title:, body:, url: nil, **kwrest)
    sender = FCM::Sender.new
    sender.create_push title: title, body: body, url: url, token: UserConfig[:fcm_token]
  end

  def send_fcm_from_model(model)
    payload = {}
    payload[:title] = model.title
    payload[:body] = model.description
    payload[:url] = model.perma_link
    send_fcm_from_hash(**payload)
  end

  settings "FCM" do
    input("Token", :fcm_token)
  end
end

