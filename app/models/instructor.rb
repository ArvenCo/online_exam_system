class Instructor < ApplicationRecord
  belongs_to :user
  has_many :subjects
end
