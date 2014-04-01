require "spec_helper"

describe Api, "sms" do
  describe "POST /api/sms" do

    before do
      @user  = FactoryGirl.create(:user)
      @phone = FactoryGirl.create(:phone, user: @user)
    end
     
    it "should create a new sms when not exist" do
      valid_params = { id_id: rand(1000), number: "hh", content: "hh", date: "dd", sms_type: "1" }   
      expect {
        post "/api/sms.json", token: @user.token, phone_id: @phone.id, sms: valid_params
      }.to change(@phone.sms, :count).by(1)
    end

    it "should return @sms when exist" do
      @sms = FactoryGirl.create(:sm, phone: @phone)
      valid_params = { id_id: @sms.id_id, number: @sms.number, content: @sms.content, date: @sms.date, sms_type: @sms.sms_type }

      expect {
        post "/api/sms.json", token: @user.token, phone_id: @phone.id, sms: valid_params
      }.to change(@phone.sms, :count).by(0)

      json = JSON.parse(response.body)
      expect(json["id"]).to eq(@sms.id)
      expect(json["id_id"]).to eq(@sms.id_id)
      expect(json["number"]).to eq(@sms.number)
    end

    after do
      @user.destroy
    end
  end
end
