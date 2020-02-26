class Event < ApplicationRecord

  scope :in_past, -> { where('start_date <= ?',Time.zone.now).order(start_date: :desc) }
  scope :in_upcoming, -> { where('start_date >= ?',Time.zone.now).order(start_date: :asc) }

  belongs_to :user
end
