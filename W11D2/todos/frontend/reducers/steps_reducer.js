import { RECEIVE_STEP } from "../actions/step_actions";
import { RECEIVE_STEPS } from "../actions/step_actions";
import { REMOVE_STEP } from "../actions/step_actions";

const stepsReducer = (oldState = {}, action) => {
  Object.freeze(oldState);
  const newState = Object.assign({}, oldState);
  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach((step) => {
        newState[step.id] = step
      });
      return newState;

    case RECEIVE_STEP:
      newState[action.step.id] = action.step;
      return newState;

    case REMOVE_STEP:
      delete newState[action.step.id];
      return newState;
    
    default:
      return oldState;
  }
}

export default stepsReducer;