class PostsController < ApplicationController
  def index
    require 'google/apis/youtube_v3'

    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:api_key]

    options = {
      channel_id: 'UCwjx6ZG4pwCvAPSozYEWymA',
      type: 'video',
      max_results: 5
    }

    # **引数
    @video_result = youtube.list_searches(:snippet, **options)

    @posts = Post.includes(:user)
  end
end
