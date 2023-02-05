class PostsController < ApplicationController
  def index
    @posts = Post.includes([:user, :video, :laugh_logs])
  end
end
