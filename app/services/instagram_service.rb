class InstagramService

  attr_reader :connection

  def initialize(user)
    @connection = Faraday.new(url: 'https://api.instagram.com/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params[:access_token] = user.token
    end
  end

  def all_grams
    build_object(parse(connection.get('users/self/media/recent/'))).data
  end

  def comments(id)
    response = connection.get("media/#{id}/comments")
    comments = build_object(parse(response)).data
    comments = comments.map do |comment|
      comment[:text]
    end
    comments
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
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
