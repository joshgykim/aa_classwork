import React from "react";

export const PokemonIndexItem = (props) => {
  console.log(props.pokemon)

  return (
    <li>
      {props.pokemon.name}
      <img src={props.pokemon.imageUrl} alt={props.pokemon.name} />
    </li>
  )
}