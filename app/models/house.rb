class House < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 16 }
  validates :address, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :city, presence: true, length: { minimum: 3, maximum: 16 }
  validates :photo, presence: true
  validates :night_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
