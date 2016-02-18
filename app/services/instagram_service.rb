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

  def all_grams
    response = connection.get('users/self/media/recent/')
    grams = Instagrams.new(response).all_grams.map do |gram|
      build_object(gram)
    end
    grams.each do |gram|
      build_object(gram).comments[:comms] = comments(gram.id)
    end
  end

  def comments(id)
    response = connection.get do |req|
      req.url "media/#{id}/comments"
      req.params['scope'] = "basic\ public_content"
    end
    Instagrams.new(response).comments.map do |comment|
      build_object(comment)
    end
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end
end



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
