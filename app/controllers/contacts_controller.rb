class ContactsController < ApplicationController
def new
  @contact = Contact.new
  
end
 
 def create
    # Разрешаем параметры
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
      redirect_to new_contacts_path, notice: "Your message sent!"
    else
      render action: 'new'
    end
    end

    private
    def contact_params
      params.require(:contact).permit(:email, :text)
    end
end
