module YoutubeApi::SaveVideo
  require 'google/apis/youtube_v3'

  # 検索結果を保存するメソッド
  def save_video(search_results)
    search_results.each do |result|
      Video.create!(
        youtube_id: result[:video_id],
        title: result[:title],
        description: result[:description],
        thumbnail: result[:thumbnail],
        view_count: result[:view_count]
      )
    end
  end
end
