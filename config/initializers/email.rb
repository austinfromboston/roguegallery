# http://www.mikeperham.com/2012/12/09/12-gems-of-christmas-4-mailcatcher-and-mail_view/

mailcatcher_port = 1025

begin
  sock = TCPSocket.new('localhost', mailcatcher_port)
  sock.close
  catcher = true
rescue
  catcher = false
end

if (Rails.env.development? && catcher)
  ActionMailer::Base.smtp_settings = { host: 'localhost', port: mailcatcher_port, }
end
