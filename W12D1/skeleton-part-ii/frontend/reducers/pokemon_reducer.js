import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return action.pokemon;
  case RECEIVE_POKEMON:
    let nextState = Object.assign({}, state);
    nextState[action.pokemon.id] = action.pokemon

    return nextState;
  default:
    return state;
  }
}
  
export default pokemonReducer;


//attack: 49
// defense: 49
// id: 1
// imageUrl: "/assets/pokemon_snaps/1-746592ddbf88f824b4897ee29c2e9018b6a88098e45136531eb45f46bb6f2e4e.svg"
// name: "Bulbasaur"
// pokeType: "grass"