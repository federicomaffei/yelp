My-Yelp
====================

My-Yelp is the Week 8 project I worked on at [Makers Academy](http://www.makersacademy.com).
This application's purpose is being a clone of Yelp, a restaurant listing and rating service. This has been our introduction to Rails, focusing especially on:

* Creating Rails applications
* The structure of Rails apps (models, views, controllers, the router, helpers)
* TDD on Rails, with RSpec & Capybara
* Associations in Rails
* Validations
* AJAX in Rails

====================

The project has been developed through 4 versions:

1. ##MVP - For the initial version the core functionality of Yelp has been duplicated - users are presented with a list of restaurants which they can leave reviews for. The features developed via TDD in this iteration are:
	- Visitors can create new restaurants using a form, specifying a name and cuisine.
	- Restaurants can be edited and deleted.
	- Visitors can leave reviews for restaurants, providing a numerical score (1-5) and a comment about their experience.
	- The restaurants listings page should display all the reviews, along with the average rating of each restaurant.
	- Restaurants must be given a name and cuisine, reviews must be given a rating from 1-5 (comment is optional).

2. ##Version 2 - adding user login via [Devise](https://github.com/makersacademy/Walkthroughs/blob/master/devise.md). The features developed via TDD in this iteration are:
	- Users can register/login
	- A user must be logged in to create restaurants.
	- Users can only edit/delete restaurants which they've created.
	- Users can only leave one review per restaurant.
	- Users can delete their own reviews.
	- Some indication should be given on the page (as part of the layout) whether the user is currently logged in, along with links to the available actions.
	- The email address of the reviewer should be displayed as part of the review.
	- Users can't review a restaurant which they created.

3. ##Version 3 - Enhanced UX with Rails helper methods and AJAX. The features developed in this iteration are:
	- Currently, when writing a review, we have to go to a separate page and trigger a page refresh. Migrate the functionality to happen asynchronously with AJAX. We'll also have to set up [Poltergeist](https://github.com/teampoltergeist/poltergeist) to enable us to run JS-enabled tests.
    - Create a helper method to allow ratings and average ratings to be displayed as stars (e.g.) rather than numbers.
	- Use CSS to enhance the overall design of the site.
	- Refactor your more complex views to use partials.

====================

The programming languages and technologies I used are:

  * Ruby

  * Rspec

  * Rails framework

  * Capybara

  * AJAX

  * Devise

  * JBuilder

====================

How to run the application:

  * In the browser enter: [http://appname.herokuapp.com/](http://appname.herokuapp.com/)

How to test the application:

  * From command line enter:
```bash
git clone git@github.com:federicomaffei/yelp.git
cd yelp
rspec
```

====================

Possible future adds to the features:

 * 

 * 