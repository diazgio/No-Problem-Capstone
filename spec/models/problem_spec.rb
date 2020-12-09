require 'rails_helper'

RSpec.describe Problem, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
