class ProfilesController < ApplicationController
  before_action :require_login

  def new
    return redirect_to edit_profile_path if current_user.profile   # 作成済みなら編集へ
    @profile = Profile.new
  end

  def create
    return redirect_to edit_profile_path if current_user.profile
    @profile = current_user.build_profile(message: params[:profile][:message])
    if @profile.save
      redirect_to user_path(current_user), notice: "プロフィールを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = current_user.profile
    redirect_to new_profile_path unless @profile                   # 未作成なら作成へ
  end

  def update
    @profile = current_user.profile
    if @profile.update(message: params[:profile][:message])
      redirect_to user_path(current_user), notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
end