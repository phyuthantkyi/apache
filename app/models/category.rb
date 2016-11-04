class Category < ApplicationRecord
  Category.find_or_create_by(name: 'Toys')
end
