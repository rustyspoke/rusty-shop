var updateLogoutTime = function(pollMs) {
  setTimeout(function(){
    $.get('/session_timeout.json', function(data, status){
      var timeLeft = data.time_left;
      var time = (timeLeft > 60) ? (Math.round(timeLeft / 60) + ' min') : (timeLeft + ' s')

      $('#logout a').html('Logout (in about ' + time + ')');
      var pollMs = (data.time_left > 60) ? 10000 : 1000;
      updateLogoutTime(pollMs);
    }).fail(function(response) {
      if(response.status == 401) {
        location.reload();
      }
    });
  }, pollMs);
}

$(document).ready(function() {
  updateLogoutTime(0);
});
