import { connect } from "react-redux";
import PokemonDetail from "./pokemon_detail";
import { fetchPokemon } from "../../util/api_util"

const mapStateToProps = (state, ownProps) => ({
  pokemon: state.pokemon[ownProps.match.params.id]
})

const mapDispatchToProps = (dispatch, ownProps) => ({
  fetchPokemon: () => dispatch(fetchPokemon(ownProps.match.params.id))
})

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)