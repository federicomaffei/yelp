require 'rails_helper'

describe 'editing restaurants' do
	context 'logged out' do
		before do 
			Restaurant.create name: 'KFC', cuisine: 'Fast Food'
		end
		it 'should not be able to edit a resturant' do
			visit '/restaurants'
			expect(page).not_to have_link 'Edit KFC'
		end

		it 'should not be able to delete a resturant' do
			visit '/restaurants'
			expect(page).not_to have_link 'Delete KFC'
		end
	end

	context 'logged in as the restaurant creator' do
		before do
			user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
			login_as(user)
			user.restaurants.create(name: 'KFC', cuisine: 'Fast Food')
		end
		it 'should be able to edit a restaurant' do
			visit '/restaurants'
			click_link 'Edit KFC'
			fill_in 'Name', with: 'Kentucky Fried Chicken'
			fill_in 'Cuisine', with: 'Fast Food'
			click_button 'Update Restaurant'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content 'Kentucky Fried Chicken'
		end
	end

	context 'logged in as another user, not the restaurant creator' do
		before do
			user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
			another_user = User.create(email: 'test2@test.com', password: '12345678', password_confirmation: '12345678')
			login_as(another_user)
			user.restaurants.create(name: 'KFC', cuisine: 'Fast Food')
		end
		it 'should not be able to edit a restaurant' do
			visit '/restaurants'
			click_link 'Edit KFC'
			expect(page).to have_content 'Not your restaurant!'
		end
	end
end