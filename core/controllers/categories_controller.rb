class CategoriesController < ApplicationController
  # GET /categories/new
  # Show new category form
  get '/new/?' do
    Category.create(name: 'Sample')
    "We made a category!"
  end

  # POST /categories/create
  # Create a new category
  post '/create/?' do
    #
  end

  # GET /categories/edit
  # Show the edit form
  get '/edit/:id' do |category|
    #
  end

  # POST /categories/update
  # Update a post
  post '/update/:id' do |category|
    #
  end

  # POST /categories/delete/:id
  # Delete a category
  post '/delete/:id' do |category|
    #
  end

  # GET /categories
  # Show all categories
  get '/?' do
    #
  end
end
