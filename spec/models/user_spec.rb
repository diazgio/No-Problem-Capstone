require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(id: 1) }

  describe 'associations' do
    it { should have_many(:problems) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:followers).class_name('Following') }
    it { should have_many(:followeds).class_name('Following') }
  end
end
