class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  has_many :problems, dependent: :destroy
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy
  has_many :follows, through: :followers, source: :followed
  has_many :followds, through: :followeds, source: :follower
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_one_attached :cover_image
  has_one_attached :photo
  scope :ordered_users, -> { order(created_at: :desc) }
  scope :user_and_following, ->(ids) { where(id: ids) }
  scope :user_who_follow, ->(ids) { where.not(id: ids) }

  def followeds_problems
    ids = follows.select(:id).ids
    ids << id
    Problem.ordered_problem.user_filter_problem(User.user_and_following(ids))
  end

  def who_follow
    ids = follows.select(:id).ids
    ids << id
    User.ordered_users.user_who_follow(ids)
  end

  def unfollow(user)
    follows.destroy(user)
  end
end
