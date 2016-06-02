var updateLogoutTime = function() {
  setTimeout(function(){
    $.get('/session_timeout.json', function(data, status){
      $('#logout a').html('Logout (in ' + data.time_left + 's)');
      updateLogoutTime();
    }).fail(function(response) {
      if(response.status == 401) {
        location.reload();
      }
    });
  }, 1000);
}

$(document).ready(function() {
  updateLogoutTime();
});
