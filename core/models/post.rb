class Post < Sequel::Model
  one_to_one :author
  many_to_many :categories
end
