class ApplicationController < ActionController::Base
  # （もとからある行はそのまま）

  helper_method :current_user, :logged_in?   # ビューでも使えるようにする

  private

  # ログイン中のユーザ（ログインしていなければ nil）
  def current_user
    @current_user ||= User.find_by(uid: session[:login_uid]) if session[:login_uid]
  end

  def logged_in?
    current_user.present?
  end

  # ログインしていなければトップに戻す
  def require_login
    redirect_to root_path, alert: "ログインしてください" unless logged_in?
  end
end