class Movie < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :episode, presence: true
  validates :episode_goal, presence: true
  validates :season, presence: true
  validates :season_goal, presence: true
end
