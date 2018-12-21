# frozen_string_literal: true

Rails.application.routes.draw do

  # resources :answers
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
  end
end
