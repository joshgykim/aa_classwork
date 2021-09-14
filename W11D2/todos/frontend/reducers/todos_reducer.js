import { RECEIVE_TODO } from "../actions/todo_actions";
import { RECEIVE_TODOS } from "../actions/todo_actions";


const todosReducer = (oldState = {}, action) => {
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState) 
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach((todo) => {
                newState[todo.id] = todo
            }); 
            return newState; 

        default: 
        return oldState; 
    }
}

export default todosReducer;
