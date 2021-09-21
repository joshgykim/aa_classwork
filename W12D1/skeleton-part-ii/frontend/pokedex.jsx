import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchPokemon } from './util/api_util'
import { receivePokemon } from './actions/pokemon_actions'

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const store = configureStore();
  window.store = store;
  window.fetchPokemon = fetchPokemon;
  window.receivePokemon = receivePokemon;
  ReactDOM.render(<Root store={store} />, rootEl)
})