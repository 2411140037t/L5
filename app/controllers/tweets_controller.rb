class TweetsController < ApplicationController
  before_action :require_login   # ログインしていないとツイート・削除できない

  def create
    tweet = current_user.tweets.new(message: params[:tweet][:message])
    if tweet.save
      redirect_to root_path, notice: "ツイートしました"
    else
      redirect_to root_path, alert: "メッセージを入力してください"
    end
  end

  def destroy
    current_user.tweets.find(params[:id]).destroy   # 自分のツイートだけ消せる
    redirect_to root_path, notice: "ツイートを削除しました"
  end
end