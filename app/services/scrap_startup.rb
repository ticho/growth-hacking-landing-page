# frozen_string_literal: true

class ScrapStartup
  include Nokogiri
  include HTTParty
  def initialize
    address = "https://lespepitestech.com/home?page=1"
    page = HTTParty.get(address)
    @nokogiri_page = Nokogiri::HTML(page)
  end
  def scrap
    # div.view-content:nth-child(1) > div:nth-child(49) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h3:nth-child(1)
    p @nokogiri_page.css('h3').text
  end
end
