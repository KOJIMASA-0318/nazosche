class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def show
    @events = current_user.events
    @no_result_events = @events.no_result.limit 5
    @upcoming_events = @events.in_upcoming.limit 5
  end

  def upcoming
    @events = current_user.events.in_upcoming
  end

  def past
    @events = current_user.events.in_past
  end

  def no_result
    @events = current_user.events.no_result
  end

end
