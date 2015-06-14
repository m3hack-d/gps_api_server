require 'twitter'
require 'voice_text_api'
require 'open3'
require 'yaml'

class Api::PerformancesController < Api::Base
  def index
    render json: { result: "OK" }
    #    Slack.chat_postMessage(text: "この内容が送られています。#{params}", username: 'Push Notification', channel: '#general')
    #    PerformanceMailer.send_information.deliver_now

    begin
      twcli = Twitter::REST::Client.new do |config|
        config.consumer_key = 'Tg6CsXOnJYL2tJs7VQ9F3xwUe'
        config.consumer_secret = 'HnfpaZh6OGH0KF1KDeQ0DuNuonaGid7aHAlLptajCqiRXSDa7M'
        config.access_token = '280897853-pI0oudWDoSBYfAYGhCuyEaiRfZM7qD0nGz7KdbSo'
        config.access_token_secret = 'EWEylShpEDBC6Hs46PnVzxHkKg4a1StAGEwqJhO25B5tN'
      end

      vt = VoiceTextAPI.new('wc3vvzk2215jna4b')

      twcli.home_timeline({"count"=>1}).each do |tweet|
        speaker = ["haruka", "hikari", "takeru"][rand(3)]
        text = "#{tweet.text}"

        if /[!！]/ =~ text then
          emolevel = "2"
        else
          emolevel = "1"
        end
        
        if /[喜嬉楽幸]/ =~ text then
          emotion = "happiness"
        elsif /[悲辛苦]/ =~ text then
          emotion = "sadness"
        elsif /[怒]/ =~ text then
          emotion = "anger"
        else
          emotion = nil
        end

        if emotion == nil then
          wav = vt.tts(text, :"#{speaker}")
        else
          wav = vt.tts(text, :"#{speaker}",emotion: :"#{emotion}", emotion_level: "#{emolevel}")
        end
        
        wav.force_encoding('utf-8')
        path = "/Users/WataruSato/Downloads/sox-14.4.2/play -"
        Open3.capture3(path, stdin_data: wav)
      end

    rescue
      print "RuntimeError: ", $!, "\n";
    end

  end

  def callback
    render text: "OK"
  end
end