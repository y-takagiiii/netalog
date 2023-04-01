class TopsController < ApplicationController
  skip_before_action :require_login

  def index; end

  def terms_of_use; end
end
