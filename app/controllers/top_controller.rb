class TopController < ApplicationController
  def main
    @tweets = Tweet.includes(:user).order(created_at: :desc)
    @tweet  = Tweet.new
    @tweets = Tweet.includes(:user, :likes).order(created_at: :desc)
  end

  def login
    user = User.find_by(uid: params[:uid])
    # 保存してある暗号化パスワードと、入力されたパスワードを照合
    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.uid
      redirect_to root_path, notice: "ログインしました"
    else
      redirect_to root_path, alert: "ユーザIDまたはパスワードが違います"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path, notice: "ログアウトしました"
  end
end