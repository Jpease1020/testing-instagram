require 'rails_helper'

RSpec.describe "user views friend index page", type: :feature do
  context "user logs in and clicks link to see followers list" do
    scenario "user is taken to followers index page" do
      it "shows followers" do
        VCR.use_cassette("user_followers#index") do
          visit '/'
          click_on "Login"
          expect(current_path).to eq(dashboard_index_path)

          click_on "#followers-link"
          expect(current_path).to eq(friends_path)
        end
      end
    end

    scenario "user clicks ona  link to see a followers page" do
      xit "shows that users instagram page" do

      end
    end
  end
end
