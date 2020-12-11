require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:problem) }

  describe 'validations' do
    subject { Comment.create(id: 1, user_id: 1, content: 'Good problem', problem_id: 1) }

    it { should validate_presence_of(:content) }
  end
end
