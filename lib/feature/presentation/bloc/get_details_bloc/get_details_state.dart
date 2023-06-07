part of 'get_details_bloc.dart';

abstract class GetDetailsState extends Equatable {
  const GetDetailsState();
  
  @override
  List<Object> get props => [];
}

class GetDetailsInitial extends GetDetailsState {}
