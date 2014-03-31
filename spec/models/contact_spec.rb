require 'spec_helper'

describe Contact do
  before do
    @user    = FactoryGirl.create(:user)
    @phone   = FactoryGirl.create(:phone, user: @user)
    @contact = FactoryGirl.create(:contact, phone: @phone)
  end
  
  it { should validate_presence_of :id_id }
  it { should validate_presence_of :number }
  it { should validate_presence_of :contact_type }

  after do
    @user.destroy
  end
end
