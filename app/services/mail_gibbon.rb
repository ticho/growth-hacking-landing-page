class MailGibbon
  require 'gibbon'
  def initialize(email)
    @email = email
  end

  def add_user
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.mailchimp[:api_key])
    gibbon.lists('9b2aa33971').members.create(body: {email_address: @email, status: "subscribed"})
  end

  def newletter
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.mailchimp[:api_key])
    recipients = {
      list_id: '9b2aa33971'
    }

    settings = {
      subject_line: "THP Newletter",
      title: "Cette semaine à THP",
      from_name: "Charles",
      reply_to: "thp.emailing@gmail.com"
    }
    
    body = {
      type: "regular",
      recipients: recipients,
      settings: settings,
      template: { 
        id: 2957,
        sections: {
          "middle": "OWO"
        }
      }
    }
    
    begin
      gibbon.campaigns.create(body: body)
    rescue Gibbon::MailChimpError => e
      puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
    end
    #gibbon.campaigns('02f0a0bb98').actions.send.create
  end
end