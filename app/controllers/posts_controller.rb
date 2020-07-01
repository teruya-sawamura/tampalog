class PostsController < ApplicationController

  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
  end

  def create
    
    @post = current_user.posts.build(post_params)
    @user = current_user

    if @post.save
      flash[:success] = "登録完了！！"
      redirect_to @user
    else
      flash[:danger] = "登録に失敗しました。"
      redirect_to @user
    end
  end

  def edit
    # @user = current_user
    @post = current_user.posts.find(params[:id])
  end

  def update
    @user = current_user
    @post = @user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "編集しました。"
      redirect_to @user
    else
      flash[:danger] = "Failed..."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.destroy
    flash[:success] = '削除しました。'
    redirect_to @user
  end

  def search
    @user = current_user
    @search = current_user.posts.ransack(params[:q])

    @search_posts = 
      if params[:q].blank?
        Post.none.search
      else  
        @search.result(distinct: true)
      end
  end


  private

  def post_params
    params.require(:post).permit(:date, :food, :protein)
  end

  def correct_user
    @user = current_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to @user
    end
  end

end
