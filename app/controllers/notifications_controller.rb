class NotificationsController < ApplicationController
  def index
    @notifications = AdminNotification.order(updated_at: :desc)
  end

  def show
    @notification = AdminNotification.find(params[:id])
  end
end
