# Database Schema
#
# This file defines the default schema used for
# Sndicate's database. If you need to alter this
# for use in a plugin or 
require 'sequel'

class Database
  def initialize(env)
    puts "Current environment is #{env}"
    # FIXME: Create proper test environment
    if env == 'development' || env == 'test'
      @db = Sequel.sqlite(SndConfig.database['name'])
    else
      @db = Sequel.connect(adapter: SndConfig.database['adapter'], user: SndConfig.database['user'], host: SndConfig.database['host'], database: SndConfig.database['name'], password: SndConfig.database['password'])
    end
  end

  # Create a new database
  def create
    @db.create_table?(:authors) do
      primary_key :id
      String :username, unique: true
      String :password, fixed: true, size: 60
      String :email, unique: true
      String :display_name, null: true
      String :bio, text: true
      String :role
      TrueClass :active, default: false
      DateTime :created_at
    end

    @db.create_table?(:posts) do
      primary_key :id
      String :title
      String :content, text: true
      String :slug, unique: true
      String :status
      foreign_key :author_id, :authors
      DateTime :published_on
      DateTime :last_updated
    end

    @db.create_table? :categories do
      primary_key :id
      String :name, unique: true
    end

    @db.create_join_table(post_id: :posts, category_id: :categories)

    @db.create_table?(:pages) do
      primary_key :id
      String :title
      String :content, text: true
      String :slug, unique: true
    end

    # @db.create_table?(:subscribers) do
    #   primary_key :id
    #   String :status
    #   # TODO: Finish this one
    # end

    # @db.create_table?(:subscriptions) do
    #   primary_key :id
    #   TrueClass :active, default: false
    #   String :host, unique: true
    #   String :label
    # end
  end

  def drop
    @db.drop_table :authors, :posts, :categories, :posts_categories, :pages
  end
end
