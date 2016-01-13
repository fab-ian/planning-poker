$(function(){
  $("#add_link").click(function(){
    var user_id = $("#selected_user_id").val()
    var user_name = $("#selected_user_id option:selected").text()
    user_li_tag = get_user_li_tag(user_id, user_name, false, 0)

    $("#users_list").append(user_li_tag)

  });  
});

var get_user_li_tag = function(user_id, user_name, edit, game_user_id){
  user_li_tag =  "<li id='user_id_" + user_id + "' class='list-group-item'><span>" + user_name + "</span> "
  user_li_tag += "<a href='/games/" + user_id + "/remove_user' data-remote='true'>(remove)</a> "

  if (edit)
    user_li_tag += "<input name='game[game_users_attributes][" + user_id + "][_destroy]' type='hidden' value='false'> "

    // set only if you add a new user to the game in "new" mode.
    if (game_user_id !== 0)
      user_li_tag += "<input name='game[game_users_attributes][" + user_id + "][id]' type='hidden' value='" + game_user_id + "'> "

  user_li_tag += "<input name='game[game_users_attributes][" + user_id + "][user_id]' type='hidden' value='" + user_id + "'> "
  user_li_tag += "</li> "

  return user_li_tag
};