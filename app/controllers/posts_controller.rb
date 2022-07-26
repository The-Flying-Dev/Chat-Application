class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc) #Active record query method
    @post = Post.new
  end

  #creates new post, broadcast message over web sockets then redirects back to index page
  def create 
    Post.create(post_params)
    ActionCable.server.broadcast(
      'PostsChannel',
      Post.all.order(created_at: :desc)
    )
    redirect_to posts_path
  end

  #increment
  def like 
    Post.find_by(id: params[:post_id]).increment!(:likes_count)
    ActionCable.server.broadcast(
      'PostsChannel',
      Post.all.order(created_at: :desc)
    )
    redirect_to posts_path
  end

  #increment
  def repost 
    Post.find_by(id: params[:post_id]).increment!(:repost_count)
    ActionCable.server.broadcast(
      'PostsChannel',
      Post.all.order(created_at: :desc)
    )
    redirect_to posts_path
  end


  private 

  def post_params 
    params.require(:post).permit(:body)
  end

end
