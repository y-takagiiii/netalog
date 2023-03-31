class PlayListsController < ApplicationController
  def new
    @play_list = PlayList.new
    render turbo_stream: turbo_stream.replace("new_playlist_form", partial: "play_lists/form", locals: { play_list: @play_list })
  end

  def create
    @play_list = PlayList.new(params[:name])
    if @play_list.save
      render turbo_stream: turbo_stream.append("new_playlist", partial: "play_lists/play_list", locals: { play_list: @play_list })
    else
      render turbo_stream: turbo_stream.replace("new_playlist", partial: "play_lists/form", locals: { play_list: @play_list })
    end
  end
end
