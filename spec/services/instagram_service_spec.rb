require 'rails_helper'

# VCR.configure do |c|
#   c.allow_http_connections_when_no_cassette = true
# end

describe  "Instagram service" do
  context "grams" do
    it "returns grams" do
      user = User.create(token: ENV['test_instagram_token'])
      VCR.use_cassette("instagram_service_#grams") do
        service = InstagramService.new(user)
        grams = service.all_grams
        gram = grams.first

        expect(gram[:id]).to eq("1187096446395313964_224650346")
      end
    end
  end

  context "grams" do
    it "returns comments" do
      user = User.create(token: ENV['test_instagram_token'])
      VCR.use_cassette("instagram_service_#comments") do
        service = InstagramService.new(user)
        grams = service.comments(ENV['test_media_id'])
        gram = grams.first

        expect(gram[:id]).to eq("118")
      end
    end
  end
end
