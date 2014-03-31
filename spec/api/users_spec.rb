require "spec_helper"
require "base64"

describe Api, "user" do
  describe "Get /api/users/validate.json" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "should be forbid" do
      get "/api/users/validate.json"
      expect(response.status).to eq(401)
    end

    it "should return current_user if provide" do
      n2 = @user.email.length.to_s
      n1 = n2.length.to_s
      str = n1 + n2 + @user.email.to_s + @user.password.to_s
      token = Base64.encode64(str)
   
      get "/api/users/validate.json?token=#{token}"
      expect(response.status).to eq(200)

      #json = JSON.parse(response.body)
      #expect(json["name"]).to eq(@user.name)
      #expect(json["email"]).to eq(@user.email)
      #expect(json["password"]).to eq(@user.password)
    end

    after do
      @user.destroy
    end
  end
end
