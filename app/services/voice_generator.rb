require 'voice_text_api'

class VoiceGenerator
  SPEAKER = [:haruka, :hikari, :takeru]

  def initialize(message)
    @message = message
    @voice = VoiceTextAPI.new('wc3vvzk2215jna4b')
  end

  def speak
    speaker = SPEAKER[rand(3)]
    text = @message
    emolevel =  text.match(/[!！]/) ? 2 : 1
    emotion = distinguish_emotion(text)

    if emotion
      wav = @voice.tts(text, speaker, emotion: emotion, emotion_level: emolevel)
    else
      wav = @voice.tts(text, speaker)
    end

    f = File.open("public/audios/hoge.wav", "wb")
    f.write(wav)
    f.close
  rescue
    puts "RuntimeError: #{$!}"
  end

  private
  def distinguish_emotion(text)
    case text
    when /[喜嬉楽幸]/
      :happiness
    when /[悲辛苦]/
      :sadness
    when /[怒]/
      :anger
    else
      nil
    end
  end
end