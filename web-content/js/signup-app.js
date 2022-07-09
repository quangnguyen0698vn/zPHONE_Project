$(document).ready(function() {
	$("#signUpForm").validate({
		rules: {
			email: {
				email: true,
				required: true,
			},
			password: {
				required: true,
				minlength: 8,
			},
			password2: {
				required: true,
				minlength: 8,
				equalTo: "#password"
			},
			phone: {
				digits: true,
			}
		},

		messages: {
			email: {
				email: 'Please check your email syntax',
				required: 'Email is required',
			},
			password: {
				required: 'This field cannot be empty',
				minlength: 'password must be at least 8 characters',
			},
			password2: {
				required: 'This field cannot be empty',
				minlength: 'password must be at least 8 characters',
				equalTo: "Password NOT match"
			},
			phone: {
				digits: 'Digits only',
			}
		}
	});
});