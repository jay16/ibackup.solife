class Api < Grape::API
  prefix "api"
  format :json

  helpers do
    def current_user
      @current_user ||= User.validate(params[:token]) if params[:token]
    end

    def authenticate!
      error!({ "error" => "401 Unauthorized" }, 401) unless current_user
    end
  end

  resource :users do

    #validate user with token
    #Example
    # /api/users/validate.json
    get :validate do
      authenticate!
      current_user.email.to_s
    end
  end
 
  resource :phones do

    # validate the phone with find_or_create
    # Example
    #   /api/phones/valiadte.json
    get :validate do
      authenticate!
      { :action => "validate" }
    end

    # Post a sms with find_or_create
    # Exaple
    # /api/phone/1/sms.json
    get ":id/sms" do
      authenticate!
      { :action => "sms" }
    end

    # Post a contact with find_or_create
    # Exaple
    # /api/phone/1/contact.json
    get ":id/contact" do
      authenticate!
      { :action => "contact" }
    end
  end

end
