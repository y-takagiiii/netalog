class LaughLogsController < ApplicationController
  def new
    @video = Video.find(1)
    @laugh_log = LaughLog.new
  end

  def create
    laugh_log_time_array = params[:laugh_log_time].split(",")
    laugh_log_time_array.each do |time|
      LaughLog.create!(post_id: 1, button_pressed_time: time)
    end
    redirect_to posts_path, success: 'ログを作成しました'
  end
end
