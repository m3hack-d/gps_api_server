class Api::PerformancesController < Api::Base
  def index
    render json: { result: "OK" }
    PerformanceMailer.send_information.deliver_now
  end
end