module EventsHelper
  def result_ja(result)
    case result
    when "upcoming"
      "開催前"
    when "success"
      "成功"
    when "failure"
      "失敗"
    when "joined"
      "参加済み"
    end
  end
end
