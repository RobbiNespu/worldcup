$(document).ready(function() {

// check for password

$('#submit').click(function()

{

var password = $('#password').val();



// check for confirmation of password

var passwordConfirm = $('#passwordConfirm').val();

if (passwordConfirm == "Confirm password" || passwordConfirm == "") {

$('#passwordConfirmError').fadeIn(500).css('color', 'red').html('<p>Please confirm your password</p>');

return false;

}

else {

$('#passwordConfirmError').fadeOut(500);
debugger;
}

if (passwordConfirm == "Confirm password" || passwordConfirm == "" || passwordConfirm != password) {

$('#passwordConfirmError').fadeIn(500).css('color', 'red').html('<p>Password does not match</p>');

return false;

}

else {

$('#passwordConfirmError').fadeOut(500);

}

});

});