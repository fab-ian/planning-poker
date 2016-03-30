require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { FactoryGirl.create(:role) }

  it 'has a vaild factory' do 
    expect(role).to  be_valid
  end
end
