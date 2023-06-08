class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :check_in, presence: true
  validates :check_out, presence: true
end
