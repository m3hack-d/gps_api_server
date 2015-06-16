class Api::PerformancesController < Api::Base
  def index
    render json: { result: "OK" }
    message = params[:message].present? ? params[:message] : "メッセージを送ってます。"
    type = params[:type]
    case type
    when "slack"
      Slack.chat_postMessage(text: message, username: 'Push Notification', channel: '#general')
    when "mail"
      PerformanceMailer.send_information(message).deliver_now
    when "voice"
      VoiceGenerator.new(message).speak
    when "twitter"
      TwitterGenerator.new(message).push_notification
    end
  end

  def delete_file
    path = Rails.root.join("public", "audios", "hoge.wav")
    File.delete(path) if File.exist?(path)
    render text: "OK"
  end

  def exist_file
    path = Rails.root.join("public", "audios", "hoge.wav")
    if File.exist?(path)
      render json: { result: true }
    else
      render json: { result: false }
    end
  end

  def callback
    render text: "OK"
  end
end