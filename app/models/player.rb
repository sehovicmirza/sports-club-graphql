# frozen_string_literal: true

class Player < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :trainings, through: :teams
  has_many :attendances, as: :attendable, dependent: :destroy

  def upcomming_schedule(limit = 10)
    trainings.upcomming.limit limit
  end

  def attendance_rate(game_day, whole_season = false)
    relevant_attendances = if whole_season
                             attendances.by_current_season(game_day)
                           else
                             attendances.by_current_season(game_day).limit(10)
                           end

    "#{((relevant_attendances.where(presence: true).count.to_f / relevant_attendances.count) * 100).to_i}%"
  end
end
