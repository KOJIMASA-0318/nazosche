json.extract! event, :id, :title, :body, :start_date, :end_date, :place, :result, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
