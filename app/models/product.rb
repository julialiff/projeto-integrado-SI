class Product < ApplicationRecord
  has_one_attached :foto
  belongs_to :comerciante
  belongs_to :category
end
