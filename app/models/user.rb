class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #내가 팔로잉 하는 사람들
  has_many :following_relations, class_name: "Relation", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :following_relations, source: :following

  #나를 팔로워 하는 사람들
  has_many :follower_relations, class_name: "Relation", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :follower_relations, source: :follower


  def generate_users
    num = 1
    5.times do
      User.create(email: "user#{num}@com", password: "111111", password_confirmation: "111111")
      num += 1
    end
  end

  def following?(other_user)
    following_relations.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relations.create(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relations.find_by(following_id: other_user.id).destroy
  end

end
