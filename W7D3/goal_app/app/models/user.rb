class User < ApplicationRecord
    validates :username, :session_token, uniqueness: true, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :password_digest, presence: true

    # S P I R E
end
