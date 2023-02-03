class SearchesController < ApplicationController
  include YoutubeApi::SearchVideo
  include YoutubeApi::SaveVideo

  def search; end

  def result
    keyword = params[:query]
    search_video(keyword)
    save_video(@search_result_videos)
  end
end
