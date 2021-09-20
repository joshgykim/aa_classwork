import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchPokemon } from './util/api_util'

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const store = configureStore();
  window.fetchPokemon = fetchPokemon;
  ReactDOM.render(<Root store={store} />, rootEl)
})