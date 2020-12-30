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
  get 'area-admin/usuarios', to: 'users#index'
  get 'area-admin/usuarios/editar', to: 'users#edit'
  get 'area-admin/usuarios/change-admin-status', to: 'users#change_admin_status'
  get 'area-admin/usuarios/activate_deactivate', to: 'users#activate_deactivate'
  get 'area-admin/vendedores/activate_deactivate', to: 'comerciantes#activate_deactivate'
  get 'area-admin/vendedores', to: 'comerciantes#index'
  get 'activate_deactivate', to: 'users#deactivate'

	root 'welcome#index'
end
