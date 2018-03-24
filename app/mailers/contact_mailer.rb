class ContactMailer < ApplicationMailer

  def success(contact)
    @contact = contact

    mail to: 'sayhi.cosmos@gmail.com', subject: 'Feedback received'
  end

end
