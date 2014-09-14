class Post < Sequel::Model(:posts)
  one_to_one :author
end
