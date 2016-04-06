require 'rails_helper'

RSpec.describe Invitation, type: :model do
  let(:user1) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:invitation) { FactoryGirl.create(:invitation,
   from_user_id: user1.id, to_user_id: user2.id) }

  it 'has a vaild factory' do 
    expect(invitation).to  be_valid
  end
end
