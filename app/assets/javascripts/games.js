$(function(){
  $("#add_link").click(function(){
    var user_id = $("#tmp_user_id").val()
    var user_name = $("#tmp_user_id option:selected").text()
    console.log(user_id)
    console.log(user_name)

    html =  "<li id='" + user_id + "'>" + user_name + "</li>"
    html += "<input name='game[game_users_attributes][" + user_id + "][user_id]' type='hidden' value='" + user_id + "'>"

    $("#users_list").append(html)

  });  
});
