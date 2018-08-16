require 'test_helper'

class MailGibbonTest < ActionDispatch::IntegrationTest
  test "add_user" do
    assert MailGibbon.new.add_user
  end
  test "recampaign" do 
    assert MailGibbon.new.newletter
  end

end