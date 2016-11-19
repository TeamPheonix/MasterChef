# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
$(document).on('turbolinks:load', function(){
	$('#img-edit').hide();
	$('#bio-edit').hide();

	$('#img-edit-button').on('click', function(){
		$('#img-edit').slideToggle(150);
		$('#img-display').slideToggle(150);
	});
	$('#bio-edit-button').on('click', function(){
		$('#bio-edit').slideToggle(150);
		$('#bio-display').slideToggle(150);
	});

});
`