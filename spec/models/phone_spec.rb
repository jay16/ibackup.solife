require 'spec_helper'

describe Phone do
  before do
    @user  = FactoryGirl.create(:user)
    @phone = FactoryGirl.create(:phone, user: @user)
  end

  it { should validate_presence_of :serial }
  it { should validate_presence_of :model }
  it { should validate_presence_of :manufacturer }

  after do
    @user.destroy
  end
end
