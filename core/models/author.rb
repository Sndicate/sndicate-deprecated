class Author < Sequel::Model(:authors)
  one_to_many :posts
end
