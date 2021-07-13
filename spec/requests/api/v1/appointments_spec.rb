# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Appointments', type: :request do
  let!(:student) { create(:student) }
  let!(:mentor) { create(:mentor) }
  describe 'GET /index' do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe 'POST mentors/:mentor_id/appointments' do
    context 'when request attributes are valid' do
      let(:valid_attributes) {
        {
          appointment: {
            description: 'Booking for code review',
            student_id: student.id,
            begin_at: '2021-07-08 15:40:00'
          }
        }
      }

      before do
        post api_v1_mentor_appointments_path(mentor, params: valid_attributes)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request attributes are invalid' do
      let(:invalid_attributes) { { appointment: { student_id: student.id, begin_at: '2021-07-08 15:40:00' } } }

      before do
        post api_v1_mentor_appointments_path(mentor, params: invalid_attributes)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(JSON.parse(response.body)['errors']).to include("Description can't be blank")
      end
    end
  end
end
