require 'rails_helper'

describe  "Instagram service" do
  context "#grams" do
    it "returns grams" do
      VCR.use_cassette("instagram_service_#grams") do
        
        # service = InstagramService.new(user)
      end
    end
  end
end
