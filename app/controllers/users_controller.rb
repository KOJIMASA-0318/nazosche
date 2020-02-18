class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  layout 'mypage'

  def show
    @events = current_user.events
  end

  def upcoming
    @events = current_user.events.where('start_date >= ?',Time.zone.now).order(start_date: "DESC")
  end

  def past
    @events = current_user.events.where('start_date <= ?',Time.zone.now).order(start_date: "DESC")
  end

end
