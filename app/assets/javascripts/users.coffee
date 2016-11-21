# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
$(document).on('turbolinks:load', function(){
	$('#img-edit').hide();
	$('#bio-edit').hide();
	$('#user-edit').hide();
	$('#first-edit').hide();
	$('#last-edit').hide();
	$('#email-edit').hide();
	$('#pswd-edit').hide();

	$('#img-edit-button').on('click', function(){
		$('#img-edit').slideToggle(150);
		$('#img-display').slideToggle(150);
	});
	$('#bio-edit-button').on('click', function(){
		$('#bio-edit').slideToggle(150);
		$('#bio-display').slideToggle(150);
	});
	$('#user-edit-button').on('click', function(){
		$('#user-edit').slideToggle(150);
		$('#user-display').slideToggle(150);
	});
	$('#first-edit-button').on('click', function(){
		$('#first-edit').slideToggle(150);
		$('#first-display').slideToggle(150);
	});
	$('#last-edit-button').on('click', function(){
		$('#last-edit').slideToggle(150);
		$('#last-display').slideToggle(150);
	});
	$('#email-edit-button').on('click', function(){
		$('#email-edit').slideToggle(150);
		$('#email-display').slideToggle(150);
	});
	$('#pswd-edit-button').on('click', function(){
		$('#pswd-edit').slideToggle(150);
		$('#pswd-display').slideToggle(150);
	});

});
`