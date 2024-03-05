part of 'will_read_bloc.dart';

sealed class WillReadState extends Equatable {
  const WillReadState();
  
  @override
  List<Object> get props => [];
}

final class WillReadInitial extends WillReadState {}
