require 'rails_helper'
# rubocop: disable  Layout/LineLength
RSpec.describe User, type: :model do
  let(:user) { User.new(id: 1) }

  describe 'associations' do
    it { should have_many(:problems) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:followers).class_name('Following') }
    it { should have_many(:followeds).class_name('Following') }
  end

  describe 'validations' do
    subject { User.create(fullname: 'mikerandome nema', username: '@MikemY', email: 'test3@test.com', password: '123456', id: 3) }

    it { should validate_presence_of(:fullname) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end
end
# rubocop: enable Layout/LineLength
