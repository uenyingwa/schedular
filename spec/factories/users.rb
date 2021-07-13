# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'MyString' }
    last_name { 'MyString' }
    time_zone { 'MyString' }
    email { 'MyString' }
    type { '' }
  end
end
