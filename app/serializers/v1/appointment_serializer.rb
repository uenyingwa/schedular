# frozen_string_literal: true

module V1
  class AppointmentSerializer
    include JSONAPI::Serializer
    attributes :description, :begin_at, :end_at
  end
end
