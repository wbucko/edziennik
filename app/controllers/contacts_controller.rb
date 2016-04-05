class ContactsController < ApplicationController
    
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      message = params[:contact][:message]

      ContactMailer.contact_email(name, email, message).deliver

      flash[:success] = 'Wiadomość wysłano.'
      redirect_to new_contact_path
    else
      flash[:danger] = 'Ups.. Wystąpił błąd, spróbuj ponownie.'
      redirect_to new_contact_path
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
