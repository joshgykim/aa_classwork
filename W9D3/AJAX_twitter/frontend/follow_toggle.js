const APIUtil = require("./api_util");

class FollowToggle { // object information such as was it clicked, who clicked it --> t/f
    constructor(el) { // el is the button, we add these to each button
        this.$el = $(el);
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");

        this.$el.text(this.render());
        this.$el.on("click", this.handleClick.bind(this));
    }

    render() {
        console.log(this.followState)
        // debugger
        if (this.followState === "unfollowed") {
            this.$el.prop("disabled", false);

            return "follow";
        } else if (this.followState === "followed") {
            this.$el.prop("disabled", false);
            return "unfollow";
        } else {
            this.$el.prop("disabled", true);
            return;
        }



    }

    handleClick(e) {
        e.preventDefault();


        if (this.followState === "followed") {
            this.followState = "unfollowing";
            this.render();


            APIUtil.unfollowUser(this.userId).then(() => {
                this.followState = "unfollowed";
                this.$el.text(this.render());
            });
        } else {
            this.followState = "following";
            this.render();
            APIUtil.followUser(this.userId).then(() => {
                this.followState = "followed";
                this.$el.text(this.render());
            });
        }

        // if (this.followState === "unfollowed") {


            // const promise = APIUtil.followUser(this.userId);

            // promise.then(() => {
            //     this.followState = "followed";
            //     this.$el.text(this.render());
            // });
        // } else {
            // const promise = APIUtil.unfollowUser(this.userId);
            // promise.then(() => {
            //     this.followState = "unfollowed";
            //     this.$el.text(this.render());
            // });
        // }

        // $.ajax({
        //     url: `/users/${this.userId}/follow`,
        //     method: (this.followState === "followed") ? ("delete") : ("post"),
        //     data: { user_id: this.userId },
        //     dataType: "JSON"
        // }).then(() => {
        //     // console.log("Success!");
        //     this.followState = (this.followState === "unfollowed") ? ("followed") : ("unfollowed");
        //     this.$el.text(this.render());
        //     // console.log(this);
        // })
    }
}

module.exports = FollowToggle;