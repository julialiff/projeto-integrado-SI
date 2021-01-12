class Product < ApplicationRecord
  has_one_attached :foto
  belongs_to :comerciante
  belongs_to :category
  has_many   :carrinhos, class_name: 'Carrinho'
  has_many   :orders
end
