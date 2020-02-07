class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end
end
