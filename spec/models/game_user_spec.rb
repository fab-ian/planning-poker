require 'rails_helper'

RSpec.describe GameUser, type: :model do
  let(:game_user) {FactoryGirl.create(:game_user)}

  it 'has a valid factory' do 
    expect(game_user).to be_valid    
  end
end
