class Product < ApplicationRecord
  belongs_to :comerciante
  belongs_to :category
end
