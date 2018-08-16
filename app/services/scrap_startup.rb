# frozen_string_literal: true

# With this class, we scrap the name of a lot of startups and store them
# Later we'll be able to follow them on Twitter to get visits on our LP

class ScrapStartup
  include Nokogiri
  include HTTParty
  def initialize
    address = "https://lespepitestech.com/home?page=1"
    page = HTTParty.get(address)
    @nokogiri_page = Nokogiri::HTML(page)
  end

  def scrap_all
    # done until 100
    (11..100).each do |index|
      address = "https://lespepitestech.com/home?page=" + index.to_s
      page = HTTParty.get(address)
      @nokogiri_page = Nokogiri::HTML(page)
      scrap
    end
  end

  def scrap
    @nokogiri_page.css('div.view-content h3').each do |item|
      if startup = Startup.find_by(name: item.text)
        p "Found existing startup, ", item.text
      else
        Startup.create(name: item.text)
        p "Creating Startup", item.text
      end
    end
  end
end
