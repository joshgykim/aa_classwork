class FollowToggle { // object information such as was it clicked, who clicked it --> t/f
    constructor(el) { // el is the button, we add these to each button
        this.$el = $(el);
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");

        this.$el.text(this.render());
        this.$el.on("click", this.handleClick.bind(this));
    }

    render() {
        if (this.followState === "unfollowed") {
            return "follow";
        } else {
            return "unfollow";
        }
    }

    handleClick(e) {
        e.preventDefault();

        $.ajax({
            url: `/users/${this.userId}/follow`,
            method: (this.followState === "followed") ? ("delete") : ("post"),
            data: {
                {}
            },
            dataType:
        })
    }
}

module.exports = FollowToggle;