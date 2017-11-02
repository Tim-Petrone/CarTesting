require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I fill in the car make and model year' do
          fill_in 'make', with: 'DeLorean'
          fill_in 'model_year', with: '1985'
      end
      And 'I can submit the information' do
        click_button 'Create new car'
      end
      Then "I can see the car's info" do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Year: 1985')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0Km/h')
      end
    end
  end
  context 'Simulating a car' do
    Steps 'Speeding up a car' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      Then "the car's speed is 0Km/h" do
        expect(page).to have_content('Speed: 0Km/h')
      end
      When "I can click the accelerate button" do
        choose('Off')
        click_button 'Parking Brake'
        click_button 'Accelerate'
      end
      Then 'the speed of the car should be 10Km/h higher' do
        expect(page).to have_content('Speed: 10Km/h')
      end
      When "I can click the brake button" do
        click_button 'Brake'
      end
      Then 'the speed of the car should be 7Km/h lower' do
        expect(page).to have_content('Speed: 3Km/h')
      end
      Then "then the car's lights are off" do
        expect(page).to have_content ("Lights are off")
      end
      When "I can click the toggle lights button" do
        click_button 'Toggle Lights'
      end
      Then "The car's lights are on" do
        expect(page).to have_content ("Lights are on")
      end
      Then 'the parking brake should be off'do
        expect(page).to have_content('Parking brake is off')
      end
      Then 'the car will not accelerate'do
        choose('On')
        click_button 'Parking Brake'
        click_button 'Accelerate'
        expect(page).to have_content('Speed: 13Km/h')
      end
      When "I can click the parking brake button" do
        choose('Off')
        click_button 'Parking Brake'
      end
      Then "the parking brake should be off" do
        expect(page).to have_content("Parking brake is off")
      end
      When "the car is moving the parking brake doesn't work" do
        click_button 'Accelerate'
        choose('On')
        click_button 'Parking Brake'
        expect(page).to have_content('Parking brake is off')
      end
    end
  end
end
