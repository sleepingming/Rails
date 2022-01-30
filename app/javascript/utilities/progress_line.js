document.addEventListener('turbolinks:load', function() {
  const progress = document.getElementById('progress-line');
  if (progress) {
    let questionsInTest = progress.dataset.questionsInTest
    let currentQuestion = progress.dataset.currentQuestion
    let oneQuestion = 100/questionsInTest
    progress.style.width = ((currentQuestion - 1) * oneQuestion) + '%'
  }
})
