require 'open-uri'

#strip info about first entry
#if new entry is posted send email to mayaman26@gmail.com

class Post
  attr_reader :entry_title, :entry_info, :entry_text, :continue_link, :entry_date
  def initialize
  html = "http://voices.pomona.edu/"
  doc = Nokogiri::HTML(open(html))
  @entry_date = doc.css('.entry-date').first.children.text
  @entry_title = doc.css('.entry-title').first.children.children.text
  @entry_info = doc.css('.entry-meta').first.children.children.text
  @entry_text = doc.css('.entry-content').first.children.children.text
  @continue_link = doc.css('.more-link').first.attributes.values.first.text
  end
end


class Email
  def send_email
  @my_email = Post.new
  Mailgun.configure do |config|
    config.api_key = 'key-55e8949e4a6c0c943e983b4139d73f51'
    config.domain  = 'sandbox6c167fe6b9f14a0fbf51500a49505f4b.mailgun.org'
  end

  @mailgun = Mailgun(:api_key => 'key-55e8949e4a6c0c943e983b4139d73f51')

  parameters = {
    :to => "mayaman26@gmail.com",
    :subject => "New Post on Voices: Pomona's Student Blog",
    :text => "#{@myemail.entry_title}" + "
  #{@myemail.entry_info}" + " 

  #{@myemail.entry_text}" + " 
  #{@myemail.continue_link}",
    :from => "mayaman26@gmail.com",\
  }
  @mailgun.messages.send_email(parameters)
  end
end


