$(document).ready(function () {
  $('.team').on('change', function (event) {
    var team = $(event.target).val();
    $.ajax({
      url: $(event.target).data("api"),
      data: {
        team: team
      },
      type: "GET",
      success: function(data, status, jqXHR) {
        //update table in dom
        debugger
        $('.test-div').html("joejoejoejoe")
      }
    })

  })
})