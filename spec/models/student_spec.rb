# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  include_examples 'user validations'
end
