class User < ApplicationRecord
    has_one :instructor
    has_one :student
    has_secure_password
    validates :name, presence: true, uniqueness:true
    validates :username, presence: true, uniqueness:true, length: {minimum:5}
    validates :password, presence: true, length: {minimum:8}
end
