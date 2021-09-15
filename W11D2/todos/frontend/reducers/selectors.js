export const allTodos = (state) => {
  const returnArr = Object.values(state.todos);

  return returnArr;
}