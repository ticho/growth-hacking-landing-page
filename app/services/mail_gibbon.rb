class MailGibbon
  require 'gibbon'
  require 'dotenv/load'
  # def initialize(email, first_name, last_name)
  #   @email = email 
  #   @first_name = first_name
  #   @last_name = last_name
  # end

  def add_user
    gibbon = Gibbon::Request.new(api_key: ENV["API_GIBBON"])
    # gibbon.lists('9b2aa33971').members.create(body: {email_address: @email, status: "subscribed"})
    # gibbon.lists('9b2aa33971').members.create(body: {email_address: "n.zhao31415@gmail.com", status: "subscribed"})
  end

  def newletter
    gibbon = Gibbon::Request.new(api_key: ENV["API_GIBBON"])
    gibbon.campaigns('mailchimp0ba270124b2035bcd4642bcff.02f0a0bb98').actions.send.create
  end
end