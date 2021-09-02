// constructor(el) { // el is the button, we add these to each button
//   this.$el = $(el);
//   this.userId = this.$el.data("user-id");
//   this.followState = this.$el.data("initial-follow-state");

//   this.$el.text(this.render());
//   this.$el.on("click", this.handleClick.bind(this));
// }

const APIUtil = {
  followUser: id => {
    $.ajax({
      url: `/users/${id}/follow`,
      method: "post",
      data: { user_id: id },
      dataType: "JSON"
    })
  },

  unfollowUser: id => {
    $.ajax({
      url: `/users/${id}/follow`,
      method: "delete",
      data: { user_id: id },
      dataType: "JSON"
    })
  }
};

module.exports = APIUtil;