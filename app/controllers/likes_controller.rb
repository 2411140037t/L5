class LikesController < ApplicationController
  before_action :require_login

  def create
    tweet = Tweet.find(params[:tweet_id])
    current_user.like_tweets << tweet unless current_user.like_tweets.include?(tweet)
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.likes.find_by(user_id: current_user.id)&.destroy
    redirect_to root_path
  end
end