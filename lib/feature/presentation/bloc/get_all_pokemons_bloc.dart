import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_pokemons_event.dart';
part 'get_all_pokemons_state.dart';

class GetAllPokemonsBloc
    extends Bloc<GetAllPokemonsEvent, GetAllPokemonsState> {
  GetAllPokemonsBloc() : super(GetAllPokemonsInitial()) {
    on<GetAllPokemonsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
