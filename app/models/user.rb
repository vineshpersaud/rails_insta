class User < ApplicationRecord
    has_secure_password

    has_many :posts
    has_many :comments

    has_many :likes, dependent: :destroy


    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    has_many :followers, through: :received_follows, source: :follower
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
    has_many :followings, through: :given_follows, source: :followed_user

    def profile_pic
        pic = self.posts.select{|post|post.profile_picture == true}
        pic = pic[0]
        if pic != nil
            return pic.image
        else
            return "cat-profile-64.png"
        end
    end
end
