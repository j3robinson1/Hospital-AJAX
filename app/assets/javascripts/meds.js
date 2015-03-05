$(document).on('click', '.create-med', function(){
  var med = {
    name: $(".name").val(),
    direction: $(".direction").val()
  };
  var hospital_id = window.location.pathname.split('/')[2];
  var patient_id = window.location.pathname.split('/')[4];
  $.ajax({
    type: 'POST',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/meds',
    dataType: 'script',
    data: {med: med}
  })
  location.reload() //horray bad practice
})
$(document).on('click', '.escape', function(){
  location.reload()
});
$(document).on("click", ".delete-med", function() {
  var hospital_id = window.location.pathname.split('/')[2];
  var patient_id = window.location.pathname.split('/')[4];
  var med_id = $(this).attr("med_id");
  $.ajax({
    type: 'DELETE',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/meds/' + med_id,
    dataType: 'script',
    success: function() {
      $("li.med-" + med_id).remove();
    }
  })
});