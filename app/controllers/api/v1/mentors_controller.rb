# frozen_string_literal: true

module Api
  module V1
    class MentorsController < ApplicationController
      before_action :set_mentor, only: :agenda
      around_action :setup_time_zone, only: :agenda

      def agenda
        schedule = day_agenda(params[:date], @mentor)
        render json: {
          success: true,
          mentor: ::V1::UserSerializer.new(@mentor).serializable_hash[:data][:attributes],
          calendar: schedule
        }, status: :ok
      end

      private

      def set_mentor
        @mentor = Mentor.find(params[:id])
      end

      # Set to mentor's time zone
      def setup_time_zone(&block)
        Time.use_zone(Time.find_zone!(@mentor.time_zone.to_i.hours), &block)
      end
    end
  end
end
