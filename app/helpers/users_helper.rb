module UsersHelper
  def result_icon(start,result)
    if start >= Time.zone.now
      return "upcoming"
    elsif start <= Time.zone.now && result == "upcoming"
      return "no_result"
    else
      return "#{result}"
    end
  end
end
