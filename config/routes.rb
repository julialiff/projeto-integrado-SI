Rails.application.routes.draw do
  resources :orders
  resources :carrinhos do
    post :create
  end


  resources :products
  resources :categories
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
    get 'vendedor/editar-cadastro', to: 'devise/registrations#edit'
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
  get 'area-admin/categorias', to: 'categories#index'
  get 'area-admin/historico-de-vendas', to: 'orders#index'
  get 'area-admin/produtos', to: 'products#index'
  get 'area-admin/usuario', to: 'users#user_details'

  get 'activate_deactivate', to: 'users#deactivate'
  get 'area-admin/categorias/activate_deactivate', to: 'categories#activate_deactivate'

  get 'vendedor/meus-produtos', to: 'comerciantes#meus_produtos'
  get 'vendedor/novo-produto', to: 'products#new'
  get 'vendedor/editar-produto', to: 'products#edit'

  get 'meu-carrinho', to: 'carrinhos#carrinho_usuario'
  get 'add_carrinho', to: 'carrinhos#add_carrinho'
  post 'add_to_carrinho', to: 'carrinhos#add_to_carrinho'
  post 'atualiza_qtd', to: 'carrinhos#atualiza_qtd'
  delete 'remover_do_carrinho', to: 'carrinhos#remover_do_carrinho'
  delete 'limpar_carrinho', to: 'carrinhos#limpar_carrinho'

  get 'checkout', to: 'orders#checkout'
  get 'criar-pedido', to: 'orders#create_order'
  get 'meus-pedidos', to: 'orders#pedidos_cliente'
  

	root 'welcome#index'
end
