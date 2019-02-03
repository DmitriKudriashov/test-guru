document.addEventListener('turbolinks:load', function () {
  var progressBar = document.querySelector('.progress-bar');
  if (progressBar) {
    var currentQuestion = progressBar.dataset.currentQuestion - 1;
    var allQuestions = progressBar.dataset.allQuestions;
    var width = (currentQuestion / allQuestions * 100) + "%";
    progressBar.style.width = width;
  }
})
