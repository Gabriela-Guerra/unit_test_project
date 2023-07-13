Rails.application.routes.draw do
  resources :contas do
    member do
      post 'transferencia'
      get 'extrato'
      patch 'bloquear'
    end
  end

  root 'contas#index'
end
