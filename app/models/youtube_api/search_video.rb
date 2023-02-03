module YoutubeApi::SearchVideo
  require 'google/apis/youtube_v3'

  # 検索結果を取得するメソッド
  def search_video(keyword)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:api_key]
    @search_result_videos = []

    options = {
      q: keyword,
      type: 'video',
      region_code: 'JP',
      order: :relevance,
      max_results: 10
    }

    search_result_videos = youtube.list_searches(:snippet, **options)

    # list_searchesメソッドだけでは再生回数を取得できないため、list_videosメソッドを使用
    search_result_videos.items.each_with_index do |item, index|
      video_id = search_result_videos.items[index].id.video_id
      video_results = youtube.list_videos(
        :statistics,
        id: video_id,
        max_results: 1,
        fields: 'items(statistics(view_count))'
      )
      view_count = video_results.items[0].statistics.view_count
      snippet = item.snippet
      thumbnail = snippet.thumbnails.high.url

      @search_result_videos << { video_id:, title: snippet.title, description: snippet.description, thumbnail:, view_count: }
    end
  end
end
