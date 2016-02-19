require 'rails_helper'

RSpec.describe "user views friend index page", type: :feature do
  context "user logs in and clicks link to see followers list" do
    scenario "user is taken to followers index page" do
      VCR.use_cassette("user_followers#index") do
        visit '/'
        click_on "Login"
        expect(current_path).to eq(dashboard_index_path)

        click_on "Followers:"
        expect(current_path).to eq(followers_path)

        expect(page).to have_content("These are the people who follow you.  They are followers")
      end
    end

    scenario "user clicks ona  link to see a followers page" do

    end
  end
end
