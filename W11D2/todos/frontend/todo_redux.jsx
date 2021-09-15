import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import {receiveTodos, receiveTodo, removeTodo} from "./actions/todo_actions";
import {receiveSteps, receiveStep, removeStep} from "./actions/step_actions";
import App from "./components/app";
import Root from "./components/Root";
import { allTodos } from "./reducers/selectors";


function Content() {
  return (
    <div>
      <h1>Todos App</h1>
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const seed = {
    todos: {
      1: {
        id: 1,
        body: 'learn selectors',
        done: 'done'
      },
      2: {
        id: 2,
        body: 'look good doing it',
        done: 'undone'
      }
    }
  };

  const store = configureStore(seed);
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
  window.store = store;

  window.allTodos = allTodos;

  const content = document.getElementById("content");
  ReactDOM.render(<Root store={store} />, content);
})