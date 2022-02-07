document.addEventListener('turbolinks:load', function() {
  const form = document.getElementById("timer")
  if (form) {
    if (form.dataset.time) {
      time = parseInt(form.dataset.time)
      timer()
      setInterval(timer, 1000)
    }
  }
})

function timer(){
  if (time >= 0) {
    let hours = Math.floor(time / 60 / 60)
    let min = Math.floor(time / 60) % 60
    let sec = time % 60
    document.getElementById('h').innerText = hours + ' часов'
    document.getElementById('m').innerText = min + ' минут'
    document.getElementById('s').innerText = sec + ' секунд'
  }
  --time
}
