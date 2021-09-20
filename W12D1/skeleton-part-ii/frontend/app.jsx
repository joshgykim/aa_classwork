import React from "react";
import { Route } from "react-router-dom";
import PokemonIndexContainer from "./components/pokemon/pokemon_index_container";
import PokemonDetail from "./components/pokemon/pokemon_detail";

export const App = () => (
  <div>
      <Route path="/pokemon/:pokemonId" component={PokemonDetail} />
      <Route path="/" component={PokemonIndexContainer} />
  </div>
)