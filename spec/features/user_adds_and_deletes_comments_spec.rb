require 'rails_helper'

RSpec.describe "user comments on a picture", type: :feature do
  context "user logs in and types a comment into the comment box" do
    scenario "the page refreshes and user sees the new comment" do
      VCR.use_cassette("user_comments#") do
        visit '/'
        click_on "Login"
        expect(current_path).to eq(dashboard_index_path)

        fill_in('comment', with: 'heyeyeyeyeyeyeye')
        click_on 'Comment'
        expect(page).to have_content('heyeyeyeyeyeyeye')
      end
    end
  end
end
