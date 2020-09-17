

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:episode) }
    it { should validate_presence_of(:episode_goal) }
    it { should validate_presence_of(:season) }
    it { should validate_presence_of(:season_goal) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
