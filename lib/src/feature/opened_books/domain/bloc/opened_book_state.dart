part of 'opened_book_bloc.dart';

sealed class OpenedBookState extends Equatable {
  const OpenedBookState();
  
  @override
  List<Object> get props => [];
}

final class OpenedBookInitial extends OpenedBookState {}
