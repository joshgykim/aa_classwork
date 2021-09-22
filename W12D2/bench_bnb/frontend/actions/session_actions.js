import * as ApiUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS'

export const login = user => dispatch => (
  ApiUtil.login(user).then(user => (
    dispatch(receiverCurrentUser(user))
  ))
);

export const signup = user => dispatch => (
  ApiUtil.signup(user).then(user => (
    dispatch(receiverCurrentUser(user))
  ))
);

export const logout = () => dispatch => (
  ApiUtil.logout().then(user => (
    dispatch(logoutCurrentUser())
  ))
);

export const receiverCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
});

export const receiverErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});