require 'rails_helper'

RSpec.describe Assignment, type: :model do
  let(:assignment) { FactoryGirl.create(:assignment) }

  it 'has a valid factory' do 
    expect(assignment).to be_valid
  end
end
