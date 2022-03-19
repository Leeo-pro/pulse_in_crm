# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # admin関連=========================================================
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  # =================================================================

  # user関連==========================================================
  devise_scope :user do
    get ':company_id/signin' => 'users/sessions#new', as: :user_login
    post ':company_id/signin' => 'users/sessions#create', as: :user_session
    delete '/users/sign_out' => 'users/sessions#destroy', as: :destroy_user_session
    get '/cancel' => 'users/registrations#cancel', as: :cancel_user_registration
    get '/sign_up' => 'users/registrations#new', as: :new_user_registration
    post '/sign_up' => 'users/registrations#create', as: :create_user_registration
    get '/edit' => 'users/registrations#edit', as: :edit_user_registration
    put '/users' => 'users/registrations#update', as: :user_registration
  end

  devise_for :users, skip: %i[registrations sessions], controllers: {
    passwords:     'users/passwords',
    confirmations: 'users/confirmations'
  }

  namespace :users do
    resources :dash_boards, only: [:index]
    resource :profile, except: %i[create new]
    resources :inquiry_reply, only: %i[new create show]
  end

  # =================================================================

  # 共通==============================================================
  # トップページ
  root 'use#top'
  # アカウント登録後ページ
  get 'registration_comp' => 'use#registration_comp'
  # 利用規約
  get 'use' => 'use#index'
  # =================================================================
end
