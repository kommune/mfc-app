class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.success(@contact).deliver_later
      flash[:notice] = 'Thank you. We will reply you shortly'
      redirect_to root_path
    else
      flash[:alert] = "Oops! There's an error."
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :email, :feedback, :status)
  end

end
