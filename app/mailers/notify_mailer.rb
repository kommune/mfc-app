class NotifyMailer < ApplicationMailer

  def new_message(user)
    @user = user
    mail to: 'sayhi.cosmos@gmail.com', subject: 'You received a new message!'
  end

end
