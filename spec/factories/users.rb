# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    time_zone { '-3' }
    email { Faker::Internet.email }
    
    factory :student, parent: :user do
      type {'Student'}
    end

    factory :mentor, parent: :user do
      type {'Mentor'}
    end
  end
end
