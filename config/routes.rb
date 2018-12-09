# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'tests#index'

  get '/questions', to: 'questions#index'

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
  end

  # resources :questions
  # resources :answers

end
