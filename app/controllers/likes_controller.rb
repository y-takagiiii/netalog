class LikesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @liked_posts = pagy(current_user.liked_posts.includes([:user, :video]).order(id: :desc))
  end

  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    render turbo_stream: turbo_stream.replace(
      post,
      partial: 'shared/like_button',
      locals: { post: post }
    )
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
    render turbo_stream: turbo_stream.replace(
      post,
      partial: 'shared/like_button',
      locals: { post: post }
    )
  end
end
