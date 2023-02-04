class SearchesController < ApplicationController
  include YoutubeApi::SearchVideo
  include YoutubeApi::SaveVideo
  include YoutubeApi::UpdateVideo

  def search; end

  def result
    @search_result_videos = []
    search_word = params[:query]
    @searched_videos = Video.where(search_word:)

    return search_from_database if save_and_recent_video?

    if save_and_old_video?
      begin
        search_video(search_word)
        update_video!(@search_result_videos, @searched_videos)
      rescue StandardError
        search_from_database
      end
    else
      begin
        search_video(search_word)
        save_video!(@search_result_videos, search_word)
      rescue StandardError
        search_from_database
      end
    end
  end

  private

  def save_and_recent_video?
    @searched_videos.present? && @searched_videos.first.recently?
  end

  def save_and_old_video?
    @searched_videos.present? && !@searched_videos.first.recently?
  end

  def search_from_database
    @searched_videos.each do |video|
      @search_result_videos << { video_id: video.youtube_id, title: video.title, description: video.description, thumbnail: video.thumbnail, view_count: video.view_count }
    end
  end
end
