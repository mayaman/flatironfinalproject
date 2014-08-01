require 'open-uri'


class Word 
  attr_reader :word, :info, :definition
  def initialize
    html = "http://dictionary.reference.com/wordoftheday/"
    doc = Nokogiri::HTML(open(html))

    @word = doc.css('.me').text
    @info = doc.css('.pron').text
    @definition = doc.css('.defn').children.text
    end

end



class Newmessage

  def initialize
    @my_word = Word.new
  # put your own credentials here
    account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
    auth_token = '2008ea097713e401a16c54029058da82'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      :from => '+18152642023',
      :to => '+17179038853',
      :body =>"#{@my_word.word}" + "
  
  #{@my_word.info}" + "
  #{@my_word.definition}"
      )
  end

end




#   Newmessage.new("#{word} " + " 
# #{info} " + " 
# #{definition}")

