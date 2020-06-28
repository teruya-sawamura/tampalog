class UsersController < ApplicationController

  before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])

    # ----投稿---------------
    @post = current_user.posts.build
    # -----------------------

    # ----投稿一覧------------
    @posts = current_user.posts.all
    # -----------------------
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザ登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールを変更しました。'
      redirect_to @user
    else
      flash[:danger] = 'プロフィールの変更に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:danger] = '退会しました。'
      redirect_to root_url
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :sex, :age, :weight, :rate)
  end




end