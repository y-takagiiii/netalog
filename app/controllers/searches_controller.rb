class SearchesController < ApplicationController
  def search; end

  def result
    require 'google/apis/youtube_v3'

    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:api_key]

    keyword = params[:query]

    options = {
      q: keyword,
      type: 'video',
      order: :relevance,
      max_results: 10
    }

    # **引数
    @search_result_videos = youtube.list_searches(:snippet, **options)
  end
end
