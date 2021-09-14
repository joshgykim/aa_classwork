import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store"

function Content() {
  return (
    <div>
      <h1>Todos App</h1>
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;

  const content = document.getElementById("content");
  ReactDOM.render(<Content/>, content);
})