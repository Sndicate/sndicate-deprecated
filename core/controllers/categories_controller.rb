class CategoriesController < ApplicationController
  get '/new/?' do
    Category.create(name: 'Sample')
    "We made a category!"
  end
end
