class Category < Sequel::Model(:categories)
  many_to_many :posts
end
