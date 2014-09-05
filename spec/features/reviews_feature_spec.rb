require 'rails_helper'

def leave_review(thoughts, rating)
	visit '/restaurants'
	fill_in 'Thoughts', with: thoughts
	select rating, from: 'Rating'
	click_button 'Create Review'
end


describe 'writing reviews' do
	context 'a logged out user' do
		it 'should not see the review form' do
			visit '/restaurants'
			expect(page).not_to have_content "Review KFC"
		end
	end

	context 'a logged in user' do
		before do
			user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
			user.restaurants.create(name: 'KFC', cuisine: 'Fast Food')
			login_as(user)
		end
		it 'should add the review of a resturant' do
			leave_review('Not great', 2)
			expect(page).to have_content 'Not great (★★☆☆☆)'
		end

		it 'should not be able to add multiple reviews' do
			leave_review('Not great', 2)
			leave_review('Really bad!', 1)
			expect(page).to have_content 'Not great (★★☆☆☆)'
			expect(page).not_to have_content 'Really bad! (★☆☆☆☆)'
			expect(page).to have_content 'You already left a review of this restaurant!'
		end
	end
end

describe 'average ratings' do
	before do
		user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
		user.restaurants.create(name: 'KFC', cuisine: 'Fast Food')
		another_user = User.create(email: 'test2@test.com', password: '12345678', password_confirmation: '12345678')
		login_as(user)
		leave_review('Not great', 2)
		login_as(another_user)
		leave_review('Great', 4)
	end

	context 'two logged in user leave two reviews' do
		it 'the app calculates and displays the average ratings' do
			expect(page).to have_content 'Average rating: ★★★☆☆'
		end
	end
end