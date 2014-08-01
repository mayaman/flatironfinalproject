#controller ("waiter in the restaurant-kitchen to table")
#passes objects to html 

require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require './lib/code.rb'
require './lib/wordoftheday.rb'

get '/' do
  @today_word = Word.new
  erb :index #this tells your program to use the html associated with the index.html.erb file in your browser
end 