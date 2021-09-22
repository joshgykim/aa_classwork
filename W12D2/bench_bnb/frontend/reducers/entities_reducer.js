import { combineReducers } from "redux";
import usersReducer from "./users_reducers";

export default combineReducers({
  users: usersReducer
})