# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:begin_at) }
    it { is_expected.to validate_presence_of(:end_at) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:student_id) }
    it { is_expected.to validate_presence_of(:mentor_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:student).class_name('User') }
    it { is_expected.to belong_to(:mentor).class_name('User') }
  end
end
