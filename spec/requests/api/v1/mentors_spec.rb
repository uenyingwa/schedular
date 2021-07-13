# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Mentors', type: :request do
  let!(:mentor) { create(:mentor) }

  describe 'GET /mentors/:id/agenda' do
    let(:params) { { date: '2021-07-07' } }

    before do
      get agenda_api_v1_mentor_path(mentor, params: params)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns full day calendar' do
      expect(JSON.parse(response.body)).to include('calendar')
    end
  end
end
