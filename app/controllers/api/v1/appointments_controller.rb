# frozen_string_literal: true

module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :set_mentor, only: %i[create]
      around_action :setup_time_zone, only: :create
      before_action :appointment_params, only: %i[create]

      def create
        @appointment = @mentor.appointments.new(appointment_params)
        @appointment.end_at = @appointment.begin_at.advance(hours: 1)
        if @appointment.overlapping?
          json_error_response(ErrorMessage.time_overlap)
        elsif @appointment.save
          json_response(
            @appointment,
            ::V1::AppointmentSerializer,
            SuccessMessage.appointment_create,
            :created
          )
        else
          json_invalid_response(@appointment)
        end
      end

      private

      def appointment_params
        params.require(:appointment).permit(:student_id, :description, :begin_at)
      end

      def set_mentor
        @mentor = Mentor.find(params[:mentor_id])
      end

      # Set to mentor's time zone
      def setup_time_zone(&block)
        Time.use_zone(Time.find_zone!(@mentor.time_zone.to_i.hours), &block)
      end
    end
  end
end
