$(document).on('click', '.create-hospital', function(){
  var hospital = {
    name: $(".name").val(),
    location: $(".location").val()
  };
  $.ajax({
    type: 'POST',
    url: '/hospitals/',
    dataType: 'script',
    data: {hospital: hospital}
  })
  location.reload();
})
$(document).on('click', '.escape', function(){
  location.reload()
  };
$(document).on("click", ".delete-hospital", function() {
  console.log("asdf");
  var hospital_id = $(this).attr("hospital_id");
  $.ajax({
    type: 'DELETE',
    url: '/hospitals/' + hospital_id,
    dataType: 'script',
    success: function() {
      $("li.hospital-" + hospital_id).remove();
    }
  })
});