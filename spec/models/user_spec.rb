require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create(:user)}

  it 'has a valid factory' do 
    expect(user).to be_valid
  end

  it 'should has an email' do 
    expect(user.email).to be_present
  end

  it 'should display "user surname"' do 
    expect(user.to_s).to eq("#{user.name} #{user.surname}")
  end
end
