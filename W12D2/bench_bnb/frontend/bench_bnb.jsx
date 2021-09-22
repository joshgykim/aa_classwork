import React from "react";
import ReactDOM from "react-dom";
import * as ApiUtil from "./util/session_api_util"

document.addEventListener("DOMContentLoaded", () => {
  window.signup = ApiUtil.signup
  window.login = ApiUtil.login
  window.logout = ApiUtil.logout

  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch; 

  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});

