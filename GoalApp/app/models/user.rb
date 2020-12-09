class User < ApplicationRecord
    # validates :username, :session_token, presence: true, uniqueness: true
    # validates :password_digest, presence: true
    # validates :password, length: {minimum: 6}, allow_nil: true
  
    # after_initialize :ensure_session_token
    attr_reader :password
    
    def self.find_by_credentials
    end 

    def is_password?(password)
    end 

    def password=(password)
        @password = password

    end 

    def reset_session_token!
    end 


    private
    
    def self.generate_session_token
    end 

    def ensure_session_token 
    end 
end
