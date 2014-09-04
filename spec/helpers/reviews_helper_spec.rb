require 'rails_helper'

RSpec.describe ReviewsHelper, :type => :helper do
	describe '#star_rating' do
		context 'not a number' do
			it 'returns the input unchanged' do
				expect(star_rating('N/A')).to eq 'N/A'
			end
		end

		context 'rating of 5 stars' do
			it 'returns a number of 5 stars' do
				expect(star_rating(5)).to eq '★★★★★'
			end
		end 

		context 'rating of 3 stars' do
			it 'returns 3 black stars and the remainder white' do
				expect(star_rating(3)).to eq '★★★☆☆'
			end
		end

		context 'rating of 2.5 stars' do
			it 'returns 3 black stars and the remainder white' do
				expect(star_rating(2.5)).to eq '★★★☆☆'
			end
		end

	end
end
