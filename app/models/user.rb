class User < ApplicationRecord
    has_secure_password
    has_many :posts

    has_many :friend_requests, dependent: :destroy
    has_many :pending_friends, through: :friend_requests, source: :friend
end
