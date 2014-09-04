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

	context 'logged out' do
		it 'should forward user to sign in page' do
			visit '/restaurants'
			click_link 'Create Restaurant'
			expect(page).to have_content 'Sign in'
		end
	end
end