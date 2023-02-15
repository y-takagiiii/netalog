class SearchesController < ApplicationController
  include YoutubeApi::SearchVideo
  include YoutubeApi::SaveVideo
  include YoutubeApi::UpdateVideo

  def search; end

  def result
    search_word = params[:query]
    @searched_videos = Video.where(search_word:)

    return @searched_videos if save_and_recent_video?

    if save_and_old_video?
      begin
        search_video(search_word)
        update_video!(@search_result_videos, @searched_videos)
        @searched_videos = Video.where(search_word:)
      rescue StandardError
        @searched_videos
      end
    else
      begin
        search_video(search_word)
        save_video!(@search_result_videos, search_word)
        @searched_videos = Video.where(search_word:)
      rescue StandardError
        @searched_videos
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
end
