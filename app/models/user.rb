class User < ApplicationRecord
  

    # has_many :bookmarks
    has_many :bookmarks, through: :pins, dependent: :destroy
    has_many :questions, dependent: :destroy
    has_many :tags, through: :questions_tags 
    has_many :solutions, through: :questions, dependent: :destroy 
    has_many :solution_notifications, dependent: :destroy 
    before_validation :downcase_email


    def downcase_email
        email.try(:downcase!)
    end

    validates :first_name, :last_name, :email, presence: true
    validates :username, presence: true, uniqueness: true
    #validates email
    validates :email, presence: true, uniqueness: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

    #validates the password
    has_secure_password
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
    validates :password, confirmation: true
    validates :password_confirmation, confirmation: true
    
    def generate_password_token!
        self.reset_password_token = generate_token
        self.reset_password_sent_at = Time.now.utc
        save!
    end

    def password_token_valid?
        (self.reset_password_sent_at + 4.hours) > Time.now.utc
    end

    def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        save!
    end

    private

    def generate_token
        SecureRandom.hex(10)
    end
  

end
