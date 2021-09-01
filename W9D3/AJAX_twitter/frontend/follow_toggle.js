class FollowToggle {
    constructor (el) {
        this.userId = this.el.data("user-id");
        this.followState = this.el.data("initial-follow-state");
        this.$el = $(el);
    }
}

module.exports = FollowToggle;