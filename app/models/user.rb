class User < ApplicationRecord
    has_one :instructor
    has_one :student
    has_secure_password
    validates :username, presence: true
end
