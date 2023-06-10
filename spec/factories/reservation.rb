FactoryBot.define do
  factory :reservation do
    association :user, factory: :user
    association :house
    transient do
      check_in_date { Faker::Date.forward(days: 30) }
      check_out_date { check_in_date + Faker::Number.between(from: 1, to: 14) }
    end
    check_in { check_in_date }
    check_out { check_out_date }

    after(:build) do |reservation|
      reservation.user.reservations << reservation
    end
  end
end
