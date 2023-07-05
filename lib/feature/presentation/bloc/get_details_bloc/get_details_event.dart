part of 'get_details_bloc.dart';

abstract class GetDetailsEvent extends Equatable {
  const GetDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDetails extends GetDetailsEvent {
  final String url;
  const GetDetails({required this.url});

  @override
  List<Object> get props => [];
}
