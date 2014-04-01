require "spec_helper"

describe Api, "phones" do
  describe "POST /api/phone/validate" do

    before do
      @user  = FactoryGirl.create(:user)
    end

    it "should create a new phone when not exist" do
      valid_params = {
          :serial => "serial_#{Time.now.to_s}",
          :manufacturer => "xiaomi#{rand(100)}",
          :model => "M1 1S",
          :device => "device"
      }   
      expect {
        post "/api/phones.json", :token => @user.token, :phone => valid_params
      }.to change(@user.phones, :count).by(1)
    end

    it "should return @phone when exist" do
      @phone = FactoryGirl.create(:phone, user: @user)
      valid_params = {
          :serial => @phone.serial,
          :manufacturer => @phone.manufacturer,
          :model => @phone.model,
          :device => @phone.device
      }   
      expect {
        post "/api/phones.json", :token => @user.token, :phone => valid_params
      }.to change(@user.phones, :count).by(0)

      #expect(response.status).to eq(200)
 
      json = JSON.parse(response.body)
      expect(json["id"]).to eq(@phone.id)
      expect(json["serial"]).to eq(@phone.serial)
      expect(json["model"]).to eq(@phone.model)
    end

    after do
      @user.destroy
    end
  end
end
