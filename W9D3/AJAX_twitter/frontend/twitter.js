const FollowToggle = require("./follow_toggle");


$(function (){
  $("button.follow-toggle").each((idx, btn) => { new FollowToggle(btn) });
});