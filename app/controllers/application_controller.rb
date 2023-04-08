class ApplicationController < ActionController::Base
  before_action :require_login, :set_notification
  add_flash_types :success, :info, :warning, :error

  private

  def set_notification
    @latest_notification = AdminNotification.last
  end
end
