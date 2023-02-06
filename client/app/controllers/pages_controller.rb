class PagesController < ApplicationController
  def home
    @posts = get_posts
  end

  def get_posts
    conn = Faraday.new(url: 'http://localhost:3001')
    response = conn.get '/posts'
    JSON.parse(response.body)

  end

  def create_post
    # Faraday post to localhost:3001
    conn = Faraday.new(url: 'http://localhost:3001')

    response = conn.post do |req|
      req.url '/posts'
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        post:
        { title: params[:title],
          views: 0 }
      }.to_json
    end
    JSON.parse(response.body)
    redirect_to root_path, notice: 'Post created'
  end

  def destroy_post
    conn = Faraday.new(url: 'http://localhost:3001')
    response = conn.delete "/posts/#{params[:id]}"
    if response.status == 204
      redirect_to root_path, notice: 'Post deleted'
    else
      redirect_to root_path, notice: 'Post not deleted'
    end
  end
end
