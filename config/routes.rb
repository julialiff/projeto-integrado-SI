Rails.application.routes.draw do
  resources :enderecos
  devise_for :comerciantes
  devise_for :users
  resources :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'cadastrar', to: 'devise/registrations#new'
    get 'editar', to: 'devise/registrations#edit'
    get 'dados-cadastrais', to: 'users#show'
  end

  get 'meus-enderecos', to: 'enderecos#enderecos_by_user'
  get 'novo-endereco', to: 'enderecos#new'
  get 'editar-endereco', to: 'enderecos#edit'
  get 'definir_padrao', to: 'enderecos#set_default'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'welcome#index'
end
