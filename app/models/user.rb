class User < ApplicationRecord
    has_secure_password
    has_many :posts

    has_many :friend_requests, dependent: :destroy
    has_many :pending_friends, through: :friend_requests, source: :friend

    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships


    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    has_many :followers, through: :received_follows, source: :follower
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
    has_many :followings, through: :given_follows, source: :followed_user

    def profile_pic
        pic = self.posts.select{|post|post.profile_picture == true}
        return pic[0]
    end
end
