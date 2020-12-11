require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:problems) }

  describe 'validations' do
    subject { Category.create(id: 1, category: 'Games') }

    it { should validate_presence_of(:category) }
    it { should validate_uniqueness_of(:category) }
  end
end
