document.addEventListener('turbolinks:load', function () {
  const form = document.querySelector('form')
  const password = form.elements.user_password
  const password_confirmation = form.elements.user_password_confirmation
  form.addEventListener('input', function() {
      if(password.value != '') pwMatch(password, password_confirmation)
    })
})

function pwMatch(password, password_confirmation) {
  if (password.value == password_confirmation.value) {
    password_confirmation.classList.remove('not-match')
    password_confirmation.classList.add('match')
    password.classList.remove('not-match')
    password.classList.add('match')
  } else if (password_confirmation.value != '') {
    password_confirmation.classList.remove('match')
    password_confirmation.classList.add('not-match')
    password.classList.remove('match')
    password.classList.add('not-match')
  }
}
