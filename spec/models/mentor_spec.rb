# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mentor, type: :model do
  include_examples 'user validations'
end
