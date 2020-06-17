class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request 
    if @contact.deliver 
      flash.now[:notice] = "Votre message a bien été envoyé, merci. Nous vous recontacterons au plus vite !"
      render :new
    else 
      flash.now[:error] = 'Votre message n\'a pas été envoyé, contactew nous via webmaster@nicolashodee.com'
      render :new
    end
  end 
end
