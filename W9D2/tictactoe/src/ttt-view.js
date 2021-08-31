class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.handler = this.handleClick.bind(this);
    this.setupBoard();
    

  }

  setupBoard() {
    const board = document.createElement('ul');

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const grid = document.createElement('li');
        grid.dataset.pos = JSON.stringify([i,j]);
        board.append(grid);
      }
    }
    this.el.append(board);
  }
  
  bindEvents() {}

  handleClick(e) {
    const el = e.target;
    if (el.nodeName === "li") {
      this.makeMove(el);
    }
  }

  makeMove(square) {}

}

module.exports = View;
