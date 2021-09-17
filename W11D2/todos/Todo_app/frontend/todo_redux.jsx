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

  const store = configureStore();
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
  window.store = store;

  window.allTodos = allTodos;

  const content = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, content);
})