import React from "react";
import { Link } from "react-router-dom"; 

export const PokemonIndexItem = (props) => {
  return (
    <Link to={`/pokemon/${props.pokemon.id}`}>
      <li className='pokemon-index-item'>
        {props.pokemon.name}
        <img src={props.pokemon.imageUrl} alt={props.pokemon.name} />
      </li>
    </Link>
  )
}