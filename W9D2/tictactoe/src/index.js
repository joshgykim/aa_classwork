const View = require("./ttt-view");
const Game = require("../ttt_node/game");

document.addEventListener("DOMContentLoaded", () => {
  const game = new Game();
  const view = new View(game, document.getElementsByClassName('ttt')[0]);
});
