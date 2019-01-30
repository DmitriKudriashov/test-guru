document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('user_password_confirmation')

  if (control) { control.addEventListener('input', passwordConfirmationCheck) }
})

function passwordConfirmationCheck() {
  var password = document.getElementById('user_password')

  if (!this.value.length) {
    document.querySelector('.octicon-alert').classList.add('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  }
  else
    if (this.value == password.value) {
      document.querySelector('.octicon-alert').classList.add('hide')
      document.querySelector('.octicon-check').classList.remove('hide')
    } else {
      document.querySelector('.octicon-alert').classList.remove('hide')
      document.querySelector('.octicon-check').classList.add('hide')
    }
}
