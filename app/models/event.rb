class Event < ApplicationRecord

  scope :in_past, -> { where('start_date <= ?',Time.zone.now).order(start_date: :desc) }
  scope :in_upcoming, -> { where('start_date >= ?',Time.zone.now).order(start_date: :asc) }
  scope :no_result, -> { in_past.where(result: "upcoming") }

  belongs_to :user
end
