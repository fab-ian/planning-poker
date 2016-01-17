require 'rails_helper'

RSpec.describe "Game", type: :request do 

  describe "GET /games/new" do 

    it 'should add Game' do 
      sign_in

      visit new_game_path
      fill_in 'game_name', with: 'Super game...'
      fill_in "Content", with: 'Super content...'
      click_button "Create Game"
      expect(page).to have_content('Game was successfully created.')
    end
  end
end
