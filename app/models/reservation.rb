class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :check_in, presence: true
  validates :check_out, presence: true
  validate :check_out_date_must_be_greater

  def check_out_date_must_be_greater
    return unless check_out.present? && check_in.present? && check_out <= check_in

    errors.add(:check_out, 'date must be greater than check-in date')
  end
end
