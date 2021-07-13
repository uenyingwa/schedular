# frozen_string_literal: true

class User < ApplicationRecord
  # As a student
  has_many :appointments, foreign_key: 'student_id'

  # As a mentor
  has_many :appointments, foreign_key: 'mentor_id'

  validates :first_name, :last_name, :email, :time_zone, :type, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
