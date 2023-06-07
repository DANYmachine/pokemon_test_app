import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_details_event.dart';
part 'get_details_state.dart';

class GetDetailsBloc extends Bloc<GetDetailsEvent, GetDetailsState> {
  GetDetailsBloc() : super(GetDetailsInitial()) {
    on<GetDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
