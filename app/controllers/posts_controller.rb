class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]

  def index
    @posts = Post.includes([:user, :video, :laugh_logs]).order(id: :desc)
  end

  def show; end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: '投稿を削除しました。'
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
end
