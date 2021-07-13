# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API
      include AgendaHandler
      include Response
    end
  end
end
