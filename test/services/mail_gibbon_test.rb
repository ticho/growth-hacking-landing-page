require 'test_helper'

class MailGibbonTest < ActionDispatch::IntegrationTest
  test "add_user" do
    assert MailGibbon.new("n.zhao@hotmail.zor").add_user
  end
  test "recampaign" do 
    assert MailGibbon.new("n.zhao@hotmail.zor").newletter
  end

end