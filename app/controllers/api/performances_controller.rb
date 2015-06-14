require 'twitter'
require 'voice_text_api'
require 'open3'

class Api::PerformancesController < Api::Base
  def index
    render json: { result: "OK" }
    #    Slack.chat_postMessage(text: "この内容が送られています。#{params}", username: 'Push Notification', channel: '#general')
    #    PerformanceMailer.send_information.deliver_now
    
    begin
      twcli = Twitter::REST::Client.new do |config|
        config.consumer_key = 'QXt7GEOi8JPMOLfotgnBvxDZ5'
        config.consumer_secret = 'EGDj91iOLjtizOgnxCfizQSW16BCIXSNPrN7eJHj9ymNsevZwc'
        config.access_token = '280897853-pI0oudWDoSBYfAYGhCuyEaiRfZM7qD0nGz7KdbSo'
        config.access_token_secret = 'EWEylShpEDBC6Hs46PnVzxHkKg4a1StAGEwqJhO25B5tN'
      end
      
      vt = VoiceTextAPI.new('wc3vvzk2215jna4b')

      twcli.home_timeline({"count"=>200}).each do |tweet|
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
        
        if Rails.env.development?
          
        else
          Open3.capture3("/Users/WataruSato/work/m3/sox/play -", :stdin_data=>wav)
        end
      end

    rescue
      print "RuntimeError: ", $!, "\n";
    end
    
  end
end