# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_least(3) }
    it { should validate_length_of(:name).is_at_least(3) }
  end

  describe 'associations' do
    it { should have_many(:movies).dependent(:destroy) }
  end
end
