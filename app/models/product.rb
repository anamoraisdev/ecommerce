class Product < ApplicationRecord
    validates :name, :category, :price,  presence: true
end
