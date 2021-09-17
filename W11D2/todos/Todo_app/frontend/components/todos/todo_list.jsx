import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form"

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let todoArrays = this.props.todos;
    return (
      <ul>
        {
          todoArrays.map((todo, index) =>
          <TodoListItem key={index} todo={todo} receiveTodo={this.props.receiveTodo} removeTodo={this.props.removeTodo}/>)
        }
        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </ul>
    )
  }
}

export default TodoList;