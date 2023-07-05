part of 'get_details_bloc.dart';

abstract class GetDetailsState extends Equatable {
  const GetDetailsState();

  @override
  List<Object> get props => [];
}

class GetDetailsEmpty extends GetDetailsState {
  @override
  List<Object> get props => [];
}

class DetailsLoading extends GetDetailsState {
  @override
  List<Object> get props => [];
}

class DetailsLoaded extends GetDetailsState {
  final DetailsEntity details;

  const DetailsLoaded(this.details);

  @override
  List<Object> get props => [details];
}

class DetailsError extends GetDetailsState {
  final String message;

  const DetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
