require 'mail'
require 'pry'
require 'cgi'


class MailParser
  def self.parse(email)
    mail = Mail.read(email)
    body = mail.parts[0].body.raw_source
    body_string = body.to_s

    string_array = clean_body(body_string)

    index = string_array.index('Kundeninformation')
    index_2 = string_array.index('Total in CHF')+1

    customer_hash = {
      date: string_array[index-1].split(' ')[1],
      window: string_array[index-1].split(' ')[2],
      name: string_array[index+1],
      street: string_array[index+3],
      zip: string_array[index+4],
      total: string_array[index_2]
    }
  end

  def self.clean_body(body_string)
    body_string = body_string.gsub('=', '%').gsub("%20", '').gsub('> ', '').gsub("\r", '')
    CGI::unescape(body_string).split(/\n/)
  end
end
