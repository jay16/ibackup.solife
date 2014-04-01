require "entities"
require "helpers"
class Api < Grape::API
  prefix "api"
  format :json

  helpers APIHelpers

  resource :users do

    #validate user with token
    #Example
    # /api/users/validate.json
    get :validate do
      authenticate!
      present current_user, :with => APIEntities::User
    end
  end
 
  resource :phones do

    # validate the phone with find_or_create
    # Example
    #   /api/phones/valiadte.json
    post do
      authenticate!

      phone = current_user.phones
      .find_or_create_by( serial: params[:phone][:serial], 
                          manufacturer: params[:phone][:manufacturer], 
                          model: params[:phone][:model])
      present phone , :with => APIEntities::Phone
    end
  end

  resource :sms do

    # Post a sms with find_or_create
    # Exaple
    # /api/sms.json
    get "/phones/:phone_id/sms" do
      authenticate!
      { :action => "sms" }
    end
  end

  resource :contacts do

    # Post a contact with find_or_create
    # Exaple
    # /api/contact.json
    post do
      authenticate!

      contact = current_user.phones.find_by(id: params[:phone_id])
        .contacts.find_or_create_by(
          id_id: params[:contact][:id_id],
          number: params[:contact][:number],
          contact_type: params[:contact][:contact_type])
    end
  end

end
