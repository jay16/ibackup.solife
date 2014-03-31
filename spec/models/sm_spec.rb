require 'spec_helper'

describe Sm do
  before do
    @user  = FactoryGirl.create(:user)
    @phone = FactoryGirl.create(:phone, user: @user)
    @sms   = FactoryGirl.create(:sm, phone: @phone)
  end

  it { should validate_presence_of :id_id }
  it { should validate_presence_of :number }
  it { should validate_presence_of :content }
  it { should validate_presence_of :date }
  it { should validate_presence_of :sms_type }

  after do
    @user.destroy
  end
end
