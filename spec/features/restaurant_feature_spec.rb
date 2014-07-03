require 'rails_helper'

describe 'restaurants listing page' do
	context 'no restaurants' do
		it 'tells me there a no restaurants' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
		end
	end

	context 'are restaurants' do
		before do
			Restaurant.create(name: 'Ledbury', cuisine: 'French')
		end

		it 'should show the restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'Ledbury'
		end
	end
end

describe 'restaurant creation form' do
	context 'input is valid' do
		it 'should be able to create a restaurant' do
			visit '/restaurants/new'

			fill_in 'Name', with: 'Burger King'
			fill_in 'Cuisine', with: 'Fast Food'
			click_button 'Create Restaurant'

			expect(current_path).to eq '/restaurants'
			expect(page).to have_content 'Burger King (Fast Food)'
		end
	end

	context 'input is not valid' do
		it 'should be able to create a restaurant' do
			visit '/restaurants/new'

			fill_in 'Name', with: 'burger King'
			fill_in 'Cuisine', with: 'ff'
			click_button 'Create Restaurant'

			expect(current_path).to eq '/restaurants'
			expect(page).not_to have_content 'burger King (ff)'
			expect(page).to have_content 'Errors'
		end
	end

end

describe 'restaurant edit form' do
	before {Restaurant.create name: 'KFC', cuisine: 'Fast Food'}
	it 'should be able to edit a restaurant' do
		visit '/restaurants'
		click_link 'Edit KFC'
		fill_in 'Name', with: 'Kentucky Fried Chicken'
		fill_in 'Cuisine', with: 'Fast Food'

		click_button 'Update Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Kentucky Fried Chicken'

	end

	it 'can delete restaurants' do
		visit '/restaurants'
		click_link 'Delete KFC'
		expect(page).not_to have_content 'KFC'
		expect(page).to have_content 'Restaurant successfully deleted'
	end
end