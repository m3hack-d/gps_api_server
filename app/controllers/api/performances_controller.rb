class Api::PerformancesController < Api::Base
  def index
    render json: { result: "OK" }
    Slack.chat_postMessage(text: 'test notification to slack', username: 'w-sato', channel: '#general')
    PerformanceMailer.send_information.deliver_now
  end
end