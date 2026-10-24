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
    @user = User.new(uid: params[:user][:uid],
                     password: params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation])
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