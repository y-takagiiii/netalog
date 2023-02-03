class PostsController < ApplicationController
  def index
    @posts = Post.includes([:user, :video, :laugh_log])
  end
end
