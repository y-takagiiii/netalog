module YoutubeApi::UpdateVideo
  require 'google/apis/youtube_v3'

  def update_video!(latest_search_results, past_search_results)
    past_search_results.each_with_index do |result, index|
      result.update!(
        youtube_id: latest_search_results[index][:video_id],
        title: latest_search_results[index][:title],
        description: latest_search_results[index][:description],
        thumbnail: latest_search_results[index][:thumbnail],
        view_count: latest_search_results[index][:view_count],
        updated_at: Time.current
      )
    end
  end
end
