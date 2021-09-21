import React from 'react';

class PokemonDetail extends React.Component {

    componentDidMount() {
        this.props.fetchPokemon(this.props.match.params.pokemonId)
    }

    componentDidUpdate(prevProps) {
        if (prevProps !== this.props) {
            this.props.fetchPokemon(this.props.match.params.pokemonId)
        }
    }

    render() {
        return (
            <ul>
                <li>{`Attack: ${this.props.attack}`}</li>
            </ul>
        )
    }
}

export default PokemonDetail;