# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :episode
      t.integer :episode_goal
      t.integer :season
      t.integer :season_goal
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
