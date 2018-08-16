class MailGibbon
  require 'gibbon'
  def initialize(email)
    @email = email
  end

  def add_user
    puts "ozo"
    puts Rails.application.credentials.mailchimp[:api_key]
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.mailchimp[:api_key])
    gibbon.lists('9b2aa33971').members.create(body: {email_address: @email, status: "subscribed"})
  end

  def newletter
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.mailchimp[:api_key])
    gibbon.campaigns('mailchimp0ba270124b2035bcd4642bcff.02f0a0bb98').actions.send.create
  end
end