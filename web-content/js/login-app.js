console.log('script is loaded');
$(document).ready(function() {
	$("#loginForm").validate({
		rules: {
			username: "required",
			password: "required",
		},
		
		messages: {	
			username: "Username cannot be empty",
			password: "Password cannot be empty",
		}	
	});
});