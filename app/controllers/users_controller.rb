class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def show
    @user = User.where(:id => params[:user_id]).first
    @user = User.find(params[:id])
    @events = Event.where(user_id: params[:id])
  end
end
