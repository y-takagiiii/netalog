class LaughLogsController < ApplicationController
  def new
    @video = Video.find(params[:id])
    @laugh_log = LaughLog.new
  end

  def create
    laugh_log_time_array = params[:laugh_log][:laugh_log_time].split(',')
    ActiveRecord::Base.transaction do
      post = current_user.posts.create!(video_id: params[:video_id])
      laugh_log_time_array.each do |time|
        LaughLog.create!(post_id: post.id, button_pressed_time: time)
      end
    end
    redirect_to posts_path, success: 'ログを作成しました'
    rescue => e
    redirect_to new_laugh_log_path(params[:video_id])
  end

  private

  def laugh_log_params
    params.require(:laugh_log).permit(:laugh_log_time)
  end
end
