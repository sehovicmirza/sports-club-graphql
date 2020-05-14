# frozen_string_literal: true

class Team < ApplicationRecord
  has_and_belongs_to_many :players
  has_and_belongs_to_many :trainings
  has_many :attendances, as: :attendable, dependent: :destroy
end
