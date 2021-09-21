import React from "react";
import { Route } from "react-router-dom";
import PokemonIndexContainer from "./components/pokemon/pokemon_index_container";
import PokemonDetailContainer from "./components/pokemon/pokemon_detail_container";

export const App = () => (
  <div>
      <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
      <Route path="/" component={PokemonIndexContainer} />
  </div>
)