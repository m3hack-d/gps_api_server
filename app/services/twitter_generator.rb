require 'twitter'

class TwitterGenerator
  CONSUMER_KEY = 'Tg6CsXOnJYL2tJs7VQ9F3xwUe'
  SONSUMER_SECRET = 'HnfpaZh6OGH0KF1KDeQ0DuNuonaGid7aHAlLptajCqiRXSDa7M'
  ACCESS_TOKEN = '280897853-pI0oudWDoSBYfAYGhCuyEaiRfZM7qD0nGz7KdbSo'
  ACCESS_TOKEN_SECRET = 'EWEylShpEDBC6Hs46PnVzxHkKg4a1StAGEwqJhO25B5tN'

  def initialize(message)
    @message = message
    @twcli = Twitter::REST::Client.new do |config|
      config.consumer_key = CONSUMER_KEY
      config.consumer_secret = SONSUMER_SECRET
      config.access_token = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def push_notification
    begin
      @twcli.update(@message)
    rescue
      print "RuntimeError: ", $!, "\n";
    end
  end

  def get_message(num)
    messages = []
    begin
      twcli.home_timeline({"count"=>num}).each do |tweet|
        messages << tweet.text
      end
    rescue
      print "RuntimeError: ", $!, "\n";
    end
    return messages
  end
end