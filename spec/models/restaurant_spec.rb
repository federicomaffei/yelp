require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	describe '#average_rating' do
		let(:kfc) { Restaurant.create name: 'KFC', cuisine: 'Fast Food'}

		it 'returns N/A if there are no reviews' do
			expect(kfc.average_rating).to eq 'N/A'
		end

		context 'with one review' do
			it 'returns the rating of that review' do
				kfc.reviews.create(rating: 3)
				expect(kfc.average_rating).to eq 3
			end
		end

		context 'with multiple review' do
			it 'returns the average of that review' do
				kfc.reviews.create(rating: 2)
				kfc.reviews.create(rating: 4)
				expect(kfc.average_rating).to eq 3.0
			end
		end

		context 'average review is not a whole number' do
			it 'returns the average as a float' do
				kfc.reviews.create(rating: 2)
				kfc.reviews.create(rating: 3)
				expect(kfc.average_rating).to eq 2.5
			end
		end
	end

	describe 'validity' do
		it 'should have a name' do
			restaurant = Restaurant.new(name: nil)
			expect(restaurant).to have(2).error_on(:name)
		end

		it 'should have a cuisine' do
			restaurant = Restaurant.new(cuisine: nil)
			expect(restaurant).to have(2).error_on(:cuisine)
		end

		it 'should have a cuisine of at least 3 characters' do
			restaurant = Restaurant.new(cuisine: 'a')
			expect(restaurant).to have(1).error_on(:cuisine)
		end
	end
end
