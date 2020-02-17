class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  layout 'mypage'

  def show
    @events = current_user.events
  end


end
