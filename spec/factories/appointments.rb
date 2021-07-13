# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    begin_at { '2021-07-13 11:07:57' }
    end_at { '2021-07-13 11:07:57' }
    description { 'MyText' }
    student { nil }
    mentor { nil }
  end
end
