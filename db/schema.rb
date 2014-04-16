# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 11) do

  create_table "banners", :force => true do |t|
    t.column "movie_id", :integer, :default => 0, :null => false
    t.column "imagename", :string, :limit => 150, :default => "", :null => false
  end

  create_table "categories", :force => true do |t|
    t.column "category", :string, :limit => 60, :default => "", :null => false
    t.column "color", :string, :limit => 10, :default => "", :null => false
  end

  create_table "categories_movies", :id => false, :force => true do |t|
    t.column "category_id", :integer, :default => 0, :null => false
    t.column "movie_id", :integer, :default => 0, :null => false
  end

  create_table "companyprofiles", :force => true do |t|
    t.column "title", :string, :default => "", :null => false
    t.column "synopsis", :text, :default => "", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.column "name", :string, :limit => 100, :default => "", :null => false
    t.column "email", :string, :limit => 100, :default => "", :null => false
    t.column "title", :string, :limit => 100, :default => "", :null => false
  end

  create_table "emails", :force => true do |t|
    t.column "address", :string, :limit => 60, :default => "", :null => false
    t.column "submitted", :date
  end

  create_table "events", :force => true do |t|
    t.column "title", :string, :default => "", :null => false
    t.column "description", :text
    t.column "imagelarge", :string
    t.column "imagesmall", :string
    t.column "eventdate", :date, :null => false
  end

  create_table "festivalmovies", :force => true do |t|
    t.column "movie_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "festival_id", :integer, :limit => 10, :default => 0, :null => false
  end

  create_table "festivals", :force => true do |t|
    t.column "title", :string, :limit => 100, :default => "", :null => false
    t.column "subtitle", :string
    t.column "description", :text
    t.column "imagesmall", :string
    t.column "imagelarge", :string
    t.column "link", :string
    t.column "festivaldate", :date, :null => false
  end

  create_table "festivals_movies", :id => false, :force => true do |t|
    t.column "movie_id", :integer, :default => 0, :null => false
    t.column "festival_id", :integer, :default => 0, :null => false
  end

  create_table "movies", :force => true do |t|
    t.column "title", :string, :limit => 100, :default => "", :null => false
    t.column "synopsis", :text, :default => "", :null => false
    t.column "cast", :text, :default => "", :null => false
    t.column "director", :string, :limit => 100, :default => "", :null => false
    t.column "link", :string, :limit => 200
    t.column "posterlarge", :string
    t.column "postersmall", :string
    t.column "trailer", :string
    t.column "releasedate", :date, :null => false
    t.column "length", :string, :limit => 15, :default => "", :null => false
    t.column "postermed", :string
    t.column "link2", :string
    t.column "link3", :string
  end

  create_table "movietimes", :force => true do |t|
    t.column "movie_id", :integer, :default => 0, :null => false
    t.column "festival_id", :integer, :default => 0, :null => false
    t.column "date", :string, :limit => 60
    t.column "time", :string, :limit => 20
    t.column "location", :string, :limit => 120
    t.column "map", :string, :limit => 200
  end

  create_table "preleases", :force => true do |t|
    t.column "title", :string, :limit => 100
    t.column "body", :text
    t.column "stitle", :string, :limit => 100
    t.column "subtitle", :string, :limit => 100
    t.column "byline", :string, :limit => 100
    t.column "sbody", :text
    t.column "date", :date
    t.column "sdate", :string, :limit => 60
  end

  create_table "questions", :force => true do |t|
    t.column "fullname", :string, :limit => 100, :default => "", :null => false
    t.column "address", :string, :limit => 150
    t.column "city", :string, :limit => 100
    t.column "state", :string, :limit => 40
    t.column "zip", :string, :limit => 15
    t.column "phone", :string, :limit => 20
    t.column "email", :string, :limit => 60, :default => "", :null => false
    t.column "comments", :text
    t.column "submitted", :datetime
  end

  create_table "registrations", :force => true do |t|
    t.column "fullname", :string, :limit => 100, :default => "", :null => false
    t.column "company", :string, :limit => 100
    t.column "phone", :string, :limit => 20
    t.column "email", :string, :limit => 60, :default => "", :null => false
    t.column "withguest", :boolean, :default => false
    t.column "event_id", :integer, :default => 0, :null => false
  end

  create_table "releaseorders", :force => true do |t|
    t.column "movie_id", :integer, :default => 0, :null => false
    t.column "order_list", :integer, :default => 0, :null => false
    t.column "active", :integer, :default => 1, :null => false
  end

  create_table "roles", :force => true do |t|
    t.column "rolename", :string, :limit => 30, :default => "", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.column "role_id", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.column "username", :string, :limit => 20, :default => "", :null => false
    t.column "password", :string, :limit => 20, :default => "", :null => false
    t.column "name", :string, :limit => 40, :default => "", :null => false
    t.column "email", :string, :limit => 60, :default => "", :null => false
  end

end