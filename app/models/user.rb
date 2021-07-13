# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, :email, :time_zone, :type, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
