class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    set_subject_options
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.send_message
      flash[:notice] = "Votre message a bien été envoyé, nous vous recontacterons au plus vite !"
      redirect_to root_path
    else
      set_subject_options
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :subject, :message)
  end

  def set_subject_options
    @subject_options = [
    "Demande de renseignements", 
    "Support technique", 
    "Problème avec votre compte", 
    "Autres"]
  end
end

