# frozen_string_literal: true

class Training < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :players, through: :teams

  scope :upcomming, -> { where(Training.arel_table[:starts_at].gt(DateTime.now)).order(starts_at: :asc) }
end
