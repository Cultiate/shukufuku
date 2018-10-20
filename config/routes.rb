Rails.application.routes.draw do
  root "root#top"

  get  "signup" => "users#new"
  post  "signup" => "users#create"
  get "send_email" => "users#send_email"
  get "invitation_type" => "invitations#invitation_type"
  get "couple_name/:user_id/:id" => "invitations#couple_name"
  get "design/:user_id/:id" => "invitations#design"
  resources :users, except: [:new, :create]
  resources :invitations
  resources :account_activations, only: [:edit]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
