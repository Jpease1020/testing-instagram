require 'rails_helper'

RSpec.describe "user logs in", type: :feature do
  it "should go to the root path after loggin out" do
    VCR.use_cassette("user_logs_out#") do
      visit '/'
      click_on "Login"
      expect(current_path).to eq(dashboard_index_path)
      click_on 'logout'
      expect(current_path).to eq(root_path)
    end
  end
end
