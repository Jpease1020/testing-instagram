class InstagramService

  attr_reader :connection

  def initialize(user)
    @connection = Faraday.new(url: 'https://api.instagram.com/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params[:access_token] = user.token
    end
  end

  def all
    response = connection.get('users/self/media/recent/')
    Instagrams.new(response).all_grams.map do |gram|
      build_object(gram)
    end
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end
end











# conn = Faraday.new(:url => 'http://sushi.com') do |faraday|
#   faraday.request  :url_encoded             # form-encode POST params
#   faraday.response :logger                  # log requests to STDOUT
#   faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
# end
#
# ## GET ##
#
# response = conn.get '/nigiri/sake.json'     # GET http://sushi.com/nigiri/sake.json
# response.body
#
# conn.get '/nigiri', { :name => 'Maguro' }   # GET http://sushi.com/nigiri?name=Maguro
#
# conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
#   req.url '/search', :page => 2
#   req.params['limit'] = 100
# end
#
# ## POST ##
#
# conn.post '/nigiri', { :name => 'Maguro' }  # POST "name=maguro" to http://sushi.com/nigiri
#
# # post payload as JSON instead of "www-form-urlencoded" encoding:
# conn.post do |req|
#   req.url '/nigiri'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "name": "Unagi" }'
# end
#
# ## Per-request options ##
#
# conn.get do |req|
#   req.url '/search'
#   req.options.timeout = 5           # open/read timeout in seconds
#   req.options.open_timeout = 2      # connection open timeout in seconds
# end
