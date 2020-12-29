Rails.application.routes.draw do
  resources :enderecos
  devise_for :comerciantes, path: 'comerciantes'
  devise_for :users
  resources :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'cadastrar', to: 'devise/registrations#new'
    get 'editar', to: 'devise/registrations#edit'
    get 'dados-cadastrais', to: 'users#show'
  end

  devise_scope :comerciante do
    get 'vendedor/login', to: 'devise/sessions#new'
    get 'vendedor/cadastrar', to: 'devise/registrations#new'
    get 'vendedor/editar', to: 'devise/registrations#edit'
    get 'vendedor/dados-cadastrais', to: 'comerciantes#show'
  end



  get 'meus-enderecos', to: 'enderecos#enderecos_by_user'
  get 'novo-endereco', to: 'enderecos#new'
  get 'editar-endereco', to: 'enderecos#edit'
  get 'definir_padrao', to: 'enderecos#set_default'
  # get 'login-vendedor', to: 'new_comerciante_session'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'welcome#index'
end
