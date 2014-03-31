require "spec_helper"

describe User do
  before do
   @user = FactoryGirl.create(:user)
  end

  subject(:user) { @user}

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  after do
    @user.destroy
  end
end
