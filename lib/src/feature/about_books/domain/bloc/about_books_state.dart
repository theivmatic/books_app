part of 'about_books_bloc.dart';

sealed class AboutBooksState extends Equatable {
  const AboutBooksState();
  
  @override
  List<Object> get props => [];
}

final class AboutBooksInitial extends AboutBooksState {}
