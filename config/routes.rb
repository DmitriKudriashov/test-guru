# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests
  resources :tests do
     resources :questions, shallow: true
  end
end
