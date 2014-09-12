# Database Schema
#
# This file defines the default schema used for
# Sndicate's database. If you need to alter any
require 'yaml'
require 'ostruct'
require 'sequel'

class Database
  def initialize(env)
    if env == 'development'
      @db = Sequel.sqlite(SndConfig.database['name'])
    else
      @db = Sequel.connect(adapter: SndConfig.database['adapter'], user: SndConfig.database['user'], host: SndConfig.database['host'], database: SndConfig.database['name'], password: SndConfig.database['password'])
    end
  end

  # Create a new database
  def create
    @db.create_table(:authors) do
      primary_key :id
    end
  end

  def drop
    
  end
end

# Create database connection
DB = x

# Authors
create_table :authors do
  primary_key :id
  String :username
