class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = @restaurant.reviews.new params[:review].permit(:thoughts, :rating)
		if @restaurant.reviews.find_by user_id: current_user.id
			flash[:notice] = 'You already left a review of this restaurant!'
			redirect_to '/restaurants'
		else
			@review.user = current_user
			@review.save
		end
	end

end
