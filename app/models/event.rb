class Event < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :result, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "の日付を正しく記入してください。") unless
    self.start_date < self.end_date
  end

  scope :in_past, -> { where('start_date <= ?',Time.zone.now).order(start_date: :desc) }
  scope :in_upcoming, -> { where('start_date >= ?',Time.zone.now).order(start_date: :asc) }
  scope :no_result, -> { in_past.where(result: "upcoming") }

  belongs_to :user
end
