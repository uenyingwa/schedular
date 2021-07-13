# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :mentor, class_name: 'User'

  validates :begin_at, :end_at, :description, :mentor_id, :student_id, presence: true
end
