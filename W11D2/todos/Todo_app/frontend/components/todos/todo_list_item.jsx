import React from "react";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      done: this.props.todo.done 
    }

    this.deleteItem = this.deleteItem.bind(this); 
    this.toggleDone = this.toggleDone.bind(this); 
  }

  deleteItem(e) {
    e.preventDefault; 
    this.props.removeTodo(this.props.todo); 
  }

  toggleDone(e) {
    e.preventDefault; 
    this.props.todo.done = this.props.todo.done ? false : true; 
    this.setState({done: this.props.todo.done ? false : true}); 
  }

  render() {
    return (
    
        <li>{this.props.todo.title}
            <button onClick={this.deleteItem}>Delete</button>
            <button onClick={this.toggleDone}>{this.props.todo.done ? "undone" : "done"}</button>
        </li>
      
    )
  }
}

export default TodoListItem;