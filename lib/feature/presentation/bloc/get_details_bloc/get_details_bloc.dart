// ignore_for_file: constant_identifier_names
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_test_app/feature/domain/entities/details_entity.dart';
import 'package:pokemon_test_app/feature/domain/usecases/get_details.dart';

import '../../../../core/error/failure.dart';

part 'get_details_event.dart';
part 'get_details_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class GetDetailsBloc extends Bloc<GetDetailsEvent, GetDetailsState> {
  final GetPokemonDetails getDetails;
  GetDetailsBloc({required this.getDetails}) : super(GetDetailsEmpty()) {
    on<GetDetails>((event, emit) async {
      emit(DetailsLoading());

      final failureOrDetails = await getDetails(UrlDetailsParams(url: event.url));
      failureOrDetails.fold(
        (error) => emit(DetailsError(message: _mapFailureToMessage(error))),
        (details) {
          emit(DetailsLoaded(details));
        },
      );
      log(state.toString());
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
