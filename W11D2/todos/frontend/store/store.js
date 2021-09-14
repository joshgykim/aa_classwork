import { createStore } from "redux";

// const store = createStore(() => ({}), preloadedState);

const configureStore = (preloadedState = {}) => {
  return createStore(() => ({}), preloadedState)
}

export default configureStore;