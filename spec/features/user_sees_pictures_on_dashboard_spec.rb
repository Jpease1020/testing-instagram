require 'rails_helper'

RSpec.describe "user logs in", type: :feature do
  it "should go to the dashboard page after loggin in" do
    VCR.use_cassette("user_logs_in#") do
      visit '/'
      click_on "Login"
      expect(current_path).to eq(dashboard_index_path)
      save_and_open_page
    end
  end

  it "should have pictures on the page" do
    
  end
end
