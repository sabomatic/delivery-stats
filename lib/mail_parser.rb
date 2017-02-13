require 'mail'


class MailParser
  def self.parse(email)
  mail = Mail.read('test/email.eml')
  body = mail.parts[0].body
  stringbody = body.to_s

  string_array = stringbody.split(/\n/)

  end
