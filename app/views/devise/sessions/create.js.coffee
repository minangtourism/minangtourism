$('#form-sign-in').closest('.nav.open').removeClass('open')
window.location = '<%= after_sign_in_path_for(current_user) %>'