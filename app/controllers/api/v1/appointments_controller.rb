# frozen_string_literal: true

module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :set_mentor, only: %i[create show update]
      around_action :setup_time_zone, only: %i[create show update]
      before_action :appointment_params, only: %i[create update]
      before_action :set_appointment, only: %i[show update destroy]


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

      def show
        json_response(
          @appointment,
          ::V1::AppointmentSerializer,
          SuccessMessage.appointment_show
        )
      end

      def update
        @appointment.attributes = appointment_params
        @appointment.end_at = @appointment.begin_at.advance(hours: 1)
        if @appointment.overlapping?
          json_error_response(ErrorMessage.time_overlap)
        elsif @appointment.save
          json_response(
            @appointment,
            ::V1::AppointmentSerializer,
            SuccessMessage.appointment_update
          )
        else
          json_invalid_response(@appointment)
        end
      end

      def destroy
        render json: { status: true, message: SuccessMessage.appointment_destroy } if @appointment.destroy
      end

      private

      def appointment_params
        params.require(:appointment).permit(:student_id, :description, :begin_at)
      end

      def set_appointment
        @appointment = Appointment.find(params[:id])
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
