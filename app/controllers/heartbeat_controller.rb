# frozen_string_literal: true

class HeartbeatController < ActionController::API
  def heart
    render json: { status: 'OK' }
  end
end
