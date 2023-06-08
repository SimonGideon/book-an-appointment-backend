class User < ApplicationRecord
  has_many :reservations

  validates :name, presence: true, length: { minimum: 3, maximum: 16 }
end
