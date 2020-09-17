# frozen_string_literal: true
# rubocop:disable Layout/LineLength
# This shiny device polishes bared foos
class Movie < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :episode, presence: true
  validates :episode_goal, presence: true
  validates :season, presence: true
  validates :season_goal, presence: true

  scope :user_movies, lambda { |id|
    where(user_id: id)
  }

  def self.progress_calc(movie)
    hash = {}
    hash['total_episode'] = movie.inject(0) { |sum, e| sum + e.episode }
    hash['total_episode_goal'] = movie.inject(0) { |sum, e| sum + e.episode_goal }
    hash['total_season'] = movie.inject(0) { |sum, e| sum + e.season }
    hash['total_season_goal'] = movie.inject(0) { |sum, e| sum + e.season_goal }
    hash
  end
end
# rubocop:enable Layout/LineLength
