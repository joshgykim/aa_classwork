import { RECEIVE_TODO } from "../actions/todo_actions";
import { RECEIVE_TODOS } from "../actions/todo_actions";
import { REMOVE_TODO } from "../actions/todo_actions";


const todosReducer = (oldState = {}, action) => {
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState) 
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach((todo) => {
                newState[todo.id] = todo
            }); 
            return newState;

        case RECEIVE_TODO:
            newState[action.todo.id] = action.todo;
            return newState;

        case REMOVE_TODO: 
            delete newState[action.todo.id];
            return newState; 

        default: 
        return oldState; 
    }
}

export default todosReducer;
