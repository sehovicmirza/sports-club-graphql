# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :attendable, polymorphic: true
  belongs_to :training

  scope :by_current_season, lambda { |game_day|
    where(session_date: DateTime.current.beginning_of_year..game_day).order(session_date: :desc)
  }
end
