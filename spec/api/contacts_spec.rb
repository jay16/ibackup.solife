require "spec_helper"

describe Api, "contacts" do
  describe "POST /api/contacts" do

    before do
      @user  = FactoryGirl.create(:user)
      @phone = FactoryGirl.create(:phone, user: @user)
    end
     
    it "should create a new contact when not exist" do
      valid_params = { id_id: rand(1000), number: "number", contact_type: "phone" }   
      expect {
        post "/api/contacts.json", token: @user.token, phone_id: @phone.id, contact: valid_params
      }.to change(@phone.contacts, :count).by(1)
    end

    it "should return @contact.id when exist" do
      @contact = FactoryGirl.create(:contact, phone: @phone)
      valid_params = { id_id: @contact.id_id, number: @contact.number, contact_type: @contact.contact_type }

      expect {
        post "/api/contacts.json", token: @user.token, phone_id: @phone.id, contact: valid_params
      }.to change(@phone.contacts, :count).by(0)

      json = JSON.parse(response.body)
      expect(json["id"]).to eq(@contact.id)
    end

    after do
      @user.destroy
    end
  end
end
