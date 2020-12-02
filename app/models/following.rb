class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def build_saving(user, current)
    return false if user == current

    return false unless Following.find_by(follower: current, followed: user).nil?

    self.follower = current
    self.followed = user
    save
  end
end
