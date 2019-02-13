document.addEventListener('turbolinks:load', function(){
  var timer = document.querySelector('.timer')
  if (timer) {
    var timeToLeft = timer.dataset.timeToLeft;
    timerOn(timer, timeToLeft);
  }
}
)

function timerOn(control, timeToLeft) {
  if (timeToLeft > 0) {
    var timerView = document.querySelector('.time_to_left');
    timerView.textContent = timeFormated(timeToLeft);
    timeToLeft--;
    setTimeout(timerOn, 1000, control, timeToLeft);
  } else {
    var resultWebPage = window.location.href + '/result';
    window.location.replace(resultWebPage);
  }
}

function timeFormated(value) {
  var seconds = value % 60 ;
  var minutes = (value - seconds) / 60 % 60;
  var hours = (value - minutes * 60 - seconds) / 60 / 60
  if  (value > 0){
    return  hours + " hours " + minutes + " minutes " + seconds + " seconds "
  } else {
    return 'Time EXPIRED!'
  }
}
