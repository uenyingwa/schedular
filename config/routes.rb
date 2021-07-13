# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'heartbeat#heart'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :mentors do
        get 'agenda', on: :member, to: 'mentors#agenda'
        resources :appointments
      end
    end
  end
end
