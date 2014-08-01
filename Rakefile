require 'nokogiri'
require 'open-uri'
require 'twilio-ruby'
require_relative 'lib/wordoftheday.rb'
require_relative 'lib/code.rb'

task :send_word do
   Newmessage.new
end


task :send_email do
  #send email with blog post

  blog_post = Post.new
  @date = Time.now
  if blog_post.entry_date == @date.strftime("%B %d, %Y")
    email = Email.new
    email.send_email
  end
end