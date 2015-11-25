class User < ActiveRecord::Base
    # Remember to create a migration!
    has_many :ratings
    has_many :hospitals, through: :ratings

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_hash, length: { in: 6..100}

    include BCrypt

    #getter method
    def password
        @password ||= Password.new(password_hash)
    end

    #setter method
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end
end
