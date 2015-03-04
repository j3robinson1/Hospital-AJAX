$(document).on('click', '.create-patient', function(){
  var patient = {
    firstName: $(".firstName").val(),
    lastName: $(".lastName").val()
  };
  var hospital_id = window.location.pathname.split('/')[2];

  console.log(hospital_id)
  $.ajax({
    type: 'POST',
    url: '/hospitals/' + hospital_id + '/patients',
    dataType: 'script',
    data: {patient: patient}
  })
  location.reload();
})
$(document).on('click', '.escape', function(){
  location.reload()
  };
$(document).on("click", ".delete-patient", function() {
  var hospital_id = window.location.pathname.split('/')[2];
  var patient_id = $(this).attr("patient_id");
  $.ajax({
    type: 'DELETE',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id,
    dataType: 'script',
    success: function() {
      $("li.patient-" + patient_id).remove();
    }
  })
});