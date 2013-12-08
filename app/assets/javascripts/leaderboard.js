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
        var tableHtml = new EJS({url: '/team_table.ejs'}).render(data);
        var fullTeamName = data.team.team.location+" "+data.team.team.nickname;
        $('.team-title').html(fullTeamName);
        $('.table').html(tableHtml);
      }
    });
  });
});