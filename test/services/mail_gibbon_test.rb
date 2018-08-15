require 'test_helper'

class MailGibbonTest < ActionDispatch::IntegrationTest
  test "should add to list" do
    assert MailGibbon.new.add_user
  end

end