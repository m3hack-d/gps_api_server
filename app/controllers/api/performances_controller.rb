class Api::PerformancesController < Api::Base
  def index
    render json: { result: "OK" }
    Slack.chat_postMessage(text: "この内容が送られています。#{params}", username: 'Push Notification', channel: '#general')
    PerformanceMailer.send_information.deliver_now
  end
end