# frozen_string_literal: true

module Response
  def json_response(resource, serializer, message, status = :ok)
    render json: {
      success: true,
      message: message,
      "#{resource.class.name.downcase}": serializer.new(resource).serializable_hash[:data][:attributes]
    }, status: status
  end

  def json_error_response(error, status = :unprocessable_entity)
    render json: {
      success: false,
      error: error
    }, status: status
  end

  def json_invalid_response(record, status = :unprocessable_entity)
    render json: {
      success: false,
      errors: record.errors.full_messages
    }, status: status
  end
end
