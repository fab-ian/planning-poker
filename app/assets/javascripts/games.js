$(function(){
  $("#add_link").click(function(){
    var user_id = $("#selected_user_id").val();
    var user_name = $("#selected_user_id option:selected").text();
    user_li_tag = get_user_li_tag(user_id, user_name, false, 0);

    $("#users_list").append(user_li_tag);
    $("#option_user_id_"+ user_id).hide();
    $("#option_user_id_0").attr("selected","selected");
    $("#selected_user_id")[0].selectedIndex = 0;
    $("#add_link").addClass("not-active");

    event.preventDefault();
  });
});

var get_user_li_tag = function(user_id, user_name, edit, game_user_id){
  user_li_tag =  "<li id='user_id_" + user_id + "' class='list-group-item'><span>" + user_name + "</span> ";
  user_li_tag += " <a href='javascript:unset_user(" + user_id + ");' >odznacz</a> ";

  if (edit)
    user_li_tag += "<input name='game[game_users_attributes][" + user_id + "][_destroy]' type='hidden' value='false'> ";

    // set only if you add a new user to the game in "new" mode.
    if (game_user_id !== 0)
      user_li_tag += "<input name='game[game_users_attributes][" + user_id + "][id]' type='hidden' value='" + game_user_id + "'> ";

  user_li_tag += "<input name='game[game_users_attributes][" + user_id + "][user_id]' type='hidden' value='" + user_id + "'> ";
  user_li_tag += "</li> ";

  return user_li_tag;
};

$(function(){
  $("#selected_user_id").change(function(){
    $("#add_link").removeClass("not-active");
  });
});

var unset_user = function(user_id){
    if ( $("#user_id_" + user_id + " input[type=hidden]").first().val() == user_id ) {
      $("#user_id_" + user_id + "").remove();
    } else {
      $("#user_id_" + user_id + "").hide();
      $("#user_id_" + user_id + " input[type=hidden]").first().val('1');
    }

    $("#option_user_id_" + user_id + "").show();
};
