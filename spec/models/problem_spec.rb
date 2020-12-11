require 'rails_helper'

RSpec.describe Problem, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    subject { Problem.create(id: 1, user_id: 1, body: 'Adam Problem', category_id: 1) }

    it { should validate_presence_of(:body) }

  end
end
