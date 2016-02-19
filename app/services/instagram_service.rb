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
    build_object(parse(connection.get("media/#{id}/comments"))).data
  end

  def create_comment(comment, id)
    connection.post do |req|
      req.url "media/#{id}/comments"
      req.body = "text=#{comment}"
    end
  end

  def delete_comment(media_id, comment_id)
    connection.delete("media/#{media-id}/comments/#{comment-id}")
  end

  def followers
    build_object(parse(connection.get("users/self/followed-by")))
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
