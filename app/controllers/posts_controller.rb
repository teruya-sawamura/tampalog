class PostsController < ApplicationController
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
  end

  def update
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:date, :food, :protein)
  end

end
