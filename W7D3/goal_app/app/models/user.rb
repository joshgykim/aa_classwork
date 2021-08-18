class User < ApplicationRecord
    validates :username, :session_token, uniqueness: true, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :password_digest, presence: true
    attr_reader :password 
    after_initialize :ensure_session_token
    # S P I R E
    def self.find_by_credential(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            return user 
        else
            return nil 
        end
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
