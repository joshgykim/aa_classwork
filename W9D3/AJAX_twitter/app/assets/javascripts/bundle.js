/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

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

        console.log()

        $.ajax({
            url: `/users/${this.userId}/follow`,
            method: (this.followState === "followed") ? ("delete") : ("post"),
            data: { user_id: this.userId },
            dataType: "JSON"
        }).then(() => {
            // console.log("Success!");
            this.followState = (this.followState === "unfollowed") ? ("followed") : ("unfollowed");
            this.$el.text(this.render());
            // console.log(this);
        })
    }
}

module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");


$(function (){
  $("button.follow-toggle").each((idx, btn) => { new FollowToggle(btn) });
});
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map