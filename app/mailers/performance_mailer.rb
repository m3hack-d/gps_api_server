class PerformanceMailer < ActionMailer::Base
  default :charset => 'ISO-2022-JP', :from => "no-reply@example.com"

  def send_information(message)
    @message = message
    mail(to: "w.sato829@gmail.com", subject: "Thanks")
  end
end