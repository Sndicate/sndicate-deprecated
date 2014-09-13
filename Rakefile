require 'sequel'
require 'colorize'

desc "Load specific environment or development by default"
task :environment do
  require 'yaml'
  require 'ostruct'

  # Default to development if no env is specified
  ENV['RACK_ENV'] ||= 'development'

  full_config = YAML.load_file("#{Dir.pwd}/snd_config.yml") || {}
  env_config = full_config[ENV['RACK_ENV']] || {}
  SndConfig = OpenStruct.new(env_config)
end

namespace :db do
  desc "Create the database"
  task :create => [:environment] do
    require './setup/database'
    database = Database.new(ENV['RACK_ENV'])
    database.create
  end

  desc "Drop the database for specified environment"
  task :drop => [:environment] do
    if ['development', 'test'].include? ENV['RACK_ENV'].to_s
      if File.exist?("./#{SndConfig.database['name']}")
        FileUtils.rm("./#{SndConfig.database['name']}")
      end
      puts "#{ENV['RACK_ENV'].capitalize} database dropped."
    else
      require './setup/database'
      database = Database.new(ENV['RACK_ENV'])
      database.drop
    end
  end

  desc "Drop and recreate database for the specified environment"
  task :reset => [:drop, :create] do |t, args|
    puts "Database recreated."
  end
end

namespace :dev do
  desc "Find TODOs and FIXMEs in code"
  task :todos do
    current_path = Dir.pwd
    files_searched = 0
    lines_searched = 0.0
    todos_found = 0.0
    Dir.glob("#{current_path}/**/*.{rb,yml,md,ru}").each do |file|
      files_searched += 1
      File.open(file) do |contents|
        line_number = 0
        contents.each_line.detect do |line|
          lines_searched += 1.0
          line_number += 1
          if line.include? "TODO:" or line.include? "FIXME:" or line.include? "NOTE:" or line.include? "IMPORTANT:"
            puts "[File: #{file.colorize(:blue)}]: [L:#{line_number.to_s.colorize(:red)}]"
            puts "#{line.lstrip}\n"
            todos_found += 1.0
          end
        end
      end
    end

    if todos_found >= 1
      puts "Found #{todos_found.to_s.colorize(:red)} in #{files_searched.to_s.colorize(:blue)} files."
      percentage = (todos_found / lines_searched) * 100
      puts "Overall todo score is #{percentage}%".colorize(:red)
    else
      puts "All systems are go. No todos found.".colorize(:green)
    end
  end
end
