require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) {FactoryGirl.create(:game)}

  it 'has a valid factory' do 
    expect(game).to be_valid
  end
end
