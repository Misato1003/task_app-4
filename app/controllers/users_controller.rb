class UsersController < ApplicationController
  def index
    @users = User.all #usersテーブルのレコードを全て取得できる
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new (user_params())
    if @user.save #DBに登録できる
      flash[:notice] = "スケジュール新規登録しました" #フラッシュメッセージ
      redirect_to users_path #別のURLに再アクセスできる
    else
      render "new"
    end
  end
  
  def user_params
    params.require(:user).permit(:title,:first_day,:last_day,:last_check,:memo)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params())
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "スケジュールを削除しました" #フラッシュメッセージ
    redirect_to :users
  end
end
