# frozen_string_literal: true

module V1
  class UserSerializer
    include JSONAPI::Serializer
    attributes :name, :email, :time_zone
  end
end
