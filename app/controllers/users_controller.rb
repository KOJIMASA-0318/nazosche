class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  layout 'mypage'

  def show
    @events = current_user.events
    @no_result_events = @events
                        .where('(start_date <= ?) AND (result = ?)',Time.zone.now,"upcoming")
                        .order(start_date: "DESC").limit 5
    @upcoming_events = @events
                        .where('start_date >= ?',Time.zone.now)
                        .order(start_date: "ASC").limit 5
  end

  def upcoming
    @events = current_user.events.where('start_date >= ?',Time.zone.now).order(start_date: "DESC")
  end

  def past
    @events = current_user.events.where('start_date <= ?',Time.zone.now).order(start_date: "DESC")
  end

end
