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
      present current_user, with: APIEntities::User
    end
  end
 
  resource :phones do

    # validate the phone with find_or_create
    # Example
    # /api/phones.json
    # Params:
    # token
    # photo:
    #  serial
    #  manufacturer
    #  model
    post do
      authenticate!
      phone = current_user.phones
      .find_or_create_by( 
        serial: params[:phone][:serial], 
        manufacturer: params[:phone][:manufacturer], 
        model: params[:phone][:model])
      phone.update_columns(params[:phone]) if phone.valid?

      present phone , with: APIEntities::Phone
    end
  end

  resource :sms do

    # Post a sms with find_or_create
    # Exaple
    # /api/sms.json
    post do
      authenticate!
      begin
        sms = current_user.phones.find_by(id: params[:phone_id])
          .sms.find_or_create_by(
            id_id: params[:sms][:id_id],
            number: params[:sms][:number],
            content: params[:sms][:content],
            date: params[:sms][:date],
            sms_type: params[:sms][:sms_type])
        sms.update_columns(params[:sms]) if sms.valid?
      rescue => e
        puts e.to_s
      end

      present sms, with: APIEntities::PostWithSms
    end
  end

  resource :contacts do

    # Post a contact with find_or_create
    # Exaple
    # /api/contacts.json
    # Params:
    # token
    # phone_id
    # contact:
    #   id_id
    #   number
    #   contact_type
    post do
      authenticate!
      contact = current_user.phones.find_by(id: params[:phone_id])
        .contacts.find_or_create_by(
          id_id: params[:contact][:id_id],
          number: params[:contact][:number],
          contact_type: params[:contact][:contact_type])
      contact.update_columns(params[:contact]) if contact.valid?

      present contact, with: APIEntities::PostWithContact
    end
  end

end
