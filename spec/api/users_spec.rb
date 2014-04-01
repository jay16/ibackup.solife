require "spec_helper"

describe Api, "user" do
  describe "Get /api/users/validate.json" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "should be forbid without token" do
      get "/api/users/validate.json"
      expect(response.status).to eq(401)
    end

    it "should return current_user with token" do
      get "/api/users/validate.json", :token => @user.token
      expect(response.status).to eq(200)

      json = JSON.parse(response.body)
      expect(json["id"]).to eq(@user.id)
      expect(json["name"]).to eq(@user.name)
      expect(json["email"]).to eq(@user.email)
      expect(json["created_at"]).to eq(@user.created_at.strftime("%Y-%m-%d %H:%M:%S"))
    end

    after do
      @user.destroy
    end
  end
end
