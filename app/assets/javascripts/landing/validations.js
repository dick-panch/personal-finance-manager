jQuery.validator.addMethod("noSpace", function(value, element) { 
  return value.indexOf(" ") < 0 && value != ""; 
}, "No space please and don't leave it empty");

$(".user-registration").validate({
	rules: {
		'user[name]': {
			required: true
		},		
		'user[username]': {
			required: true,
			minlength: 5,
			noSpace: true,
			remote: {
				type: 'get',
				url: '/existUsername',
				dataType: 'json'
			}				
		},
		'user[password]': {
			required: true,
			minlength: 5
		},
		'user[password_confirmation]': {
			required: true,
			minlength: 5,
			equalTo: "#user_password"
		},
		'user[email]': {
			required: true,
			email: true,
			remote: {
				type: 'get',
				url: '/existEmail',
				dataType: 'json'
			}
		}	
	},
	messages: {
		'user[name]': {
			required: "Please enter your firstname"
		},
		'user[username]': {
			required: "Please enter a username",
			minlength: "Your username must consist of at least 2 characters",
			remote: "Username already exist"
		},
		'user[password]': {
			required: "Please provide a password",
			minlength: "Your password must be at least 5 characters long"
		},
		'user[password_confirmation]': {
			required: "Please provide a password",
			minlength: "Your password must be at least 5 characters long",
			equalTo: "Please enter the same password as above"
		},
		'user[email]': {
			required: "Please enter a valid email address",
			remote: 'Email already exist'
		}
	}
});


$(".user-session").validate({
	rules: {
		'user[password]': {
			required: true,
			minlength: 5
		},
		'user[email]': {
			required: true,
			email: true
		}	
	},
	messages: {
		'user[password]': {
			required: "Please provide a password",
			minlength: "Your password must be at least 5 characters long"
		},
		'user[email]': {
			required: "Please enter a valid email address"			
		}
	}
});

$(".user-forget-password").validate({
	rules: {
		'user[email]': {
			required: true,
			email: true,
			remote: {
				type: 'get',
				url: '/notExistEmail',
				dataType: 'json'
			}			
		}	
	},
	messages: {
		'user[email]': {
			required: "Please enter a valid email address",
			remote: 'Email not exist '
		}
	}	
})


$(".user-change-password").validate({
	rules: {
		'user[password]': {
			required: true,
			minlength: 5
		},
		'user[password_confirmation]': {
			required: true,
			minlength: 5,
			equalTo: "#user_password"
		}
	},
	messages: {
		'user[password]': {
			required: "Please provide a password",
			minlength: "Your password must be at least 5 characters long"
		},
		'user[password_confirmation]': {
			required: "Please provide a password",
			minlength: "Your password must be at least 5 characters long",
			equalTo: "Please enter the same password as above"
		}
	}	
})

$(".user-resent-confirmation").validate({
	rules: {
		'user[email]': {
			required: true,
			email: true,
			remote: {
				type: 'get',
				url: '/notExistEmail',
				dataType: 'json'
			}			
		}	
	},
	messages: {
		'user[email]': {
			required: "Please enter a valid email address",
			remote: 'Email not exist '
		}
	}		
})