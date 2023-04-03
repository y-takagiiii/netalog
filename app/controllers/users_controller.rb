class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, :set_posts, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to posts_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_profile_params)
      redirect_to user_path(@user), success: 'プロフィールを更新しました。'
    else
      render :edit, error: 'プロフィールを更新できませんでした。'
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path, success: t('.success')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_posts
    @posts = Post.where(user_id: params[:id]).includes(:video, :user)
  end

  def user_profile_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
