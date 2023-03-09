class LikesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @liked_posts = pagy(current_user.liked_posts.includes([:user, :video])).order(id: :desc)
  end

  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
    redirect_to posts_path
  end
end
