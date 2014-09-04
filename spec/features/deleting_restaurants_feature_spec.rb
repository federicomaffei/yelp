require 'rails_helper'

describe 'deleting restaurants' do
	context 'logged out' do
		before do 
			Restaurant.create name: 'KFC', cuisine: 'Fast Food'
		end
		it 'cannot delete resturants' do
			visit '/restaurants'
			expect(page).not_to have_content 'Delete KFC'
		end
	end

	context 'logged in as the restaurant creator' do
		before do
			user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
			login_as(user)
			user.restaurants.create(name: 'KFC', cuisine: 'Fast Food')
		end
		it 'can delete restaurants' do
			visit '/restaurants'
			click_link 'Delete KFC'
			expect(page).not_to have_content 'KFC'
			expect(page).to have_content 'Restaurant successfully deleted'
		end
	end

	context 'logged in as another user, not the restaurant creator' do
		before do
			user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
			another_user = User.create(email: 'test2@test.com', password: '12345678', password_confirmation: '12345678')
			login_as(another_user)
			user.restaurants.create(name: 'KFC', cuisine: 'Fast Food')
		end
		it 'cannot delete restaurants' do
			visit '/restaurants'
			click_link 'Delete KFC'
			expect(page).to have_content 'Not your restaurant!'
			expect(page).not_to have_content 'Restaurant successfully deleted'
		end
	end
end