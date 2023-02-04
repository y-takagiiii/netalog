module YoutubeApi::SaveVideo
  require 'google/apis/youtube_v3'

  def save_video!(search_results, keyword)
    search_results.each do |result|
      Video.create!(
        search_word: keyword,
        youtube_id: result[:video_id],
        title: result[:title],
        description: result[:description],
        thumbnail: result[:thumbnail],
        view_count: result[:view_count]
      )
    end
  end
end
