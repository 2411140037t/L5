class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user   = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    pass = params[:user][:pass]
    @user = User.new(uid: params[:user][:uid])
    @user.pass = BCrypt::Password.create(pass) if pass.present?   # 暗号化して入れる
    if @user.save
      redirect_to users_path, notice: "ユーザ登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, notice: "ユーザを削除しました"
  end
end