class Admin::ContactsController < ApplicationController

  layout 'admin'
  before_action :authenticate_admin!

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = 'Feedback updated'
      redirect_to admin_contacts_path
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
