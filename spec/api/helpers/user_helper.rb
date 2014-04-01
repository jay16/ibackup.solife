require "spec_helper"

describe APIHelpers do
  before { extend APIHelpers }

  it "should get current_user by private token" do
    @user = FactoryGirl.create(:user)

    stub_params(:token => @user.token)
    expect(current_user).to eq(@user)
  end

  it "should return current_user as nil if token not correct" do
    stub_params(:token => "thisisnotatoken")
    expect(current_user).to eq(nil)
  end

  private
  def stub_params(p = {})
    self.stub!(:params).and_return(p)
  end
end
