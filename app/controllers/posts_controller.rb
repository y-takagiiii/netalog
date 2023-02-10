class PostsController < ApplicationController
  def index
    @posts = Post.includes([:user, :video, :laugh_logs]).order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
