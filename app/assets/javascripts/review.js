$(document).ready(function(){
	$('.new_review').on('submit', function(event){
		event.preventDefault();
		$.post($(this).attr('action'), $(this).serialize(), function(review) {
			$('ul.reviews').append('<li>' + review.thoughts + '(' + review.rating + ')</li>')
		});
	})
})