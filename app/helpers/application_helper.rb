module ApplicationHelper
  # 選択中のサイドメニューのクラスを返す
  def sidebar_activate(sidebar_link_url)
    current_url = request.path
    if current_url.match(sidebar_link_url)
      ' class="active"'
    else
      ''
    end
  end

  # サイドメニューの項目を出力する
  def sidebar_list_items
    items = [
      {:text => 'カレンダー',   :path => user_events_path(current_user)},
      {:text => '予定を追加する',   :path => new_user_event_path(current_user)},
      {:text => '参加予定イベント',   :path => user_upcoming_path(current_user)},
      {:text => '参加済イベント',   :path => user_past_path(current_user)}
    ]

    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html = html + %Q(<li#{sidebar_activate(path)}><a href="#{path}">#{text}</a></li>)
    end

    raw(html)
  end
end
