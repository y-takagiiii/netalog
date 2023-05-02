class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    binding.b
    provider = auth_params[:provider]
    if auth_params[:denied].present? || auth_params[:error] == 'ACCESS_DENIED'
      redirect_to login_path, warning: 'ログインをキャンセルしました'
      return
    end

    begin
      create_user_from(provider) unless (@user = login_form(provider))
      redirect_to posts_path, success: "#{provider.titleize}アカウントでログインしました"
    rescue StandardError
      redirect_to login_path, error: "#{provider.titleize}アカウントでのログインに失敗しました"
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied, :error, :scope, :authuser, :prompt)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
