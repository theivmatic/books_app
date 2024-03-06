import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_books_event.dart';
part 'about_books_state.dart';

class AboutBooksBloc extends Bloc<AboutBooksEvent, AboutBooksState> {
  AboutBooksBloc() : super(AboutBooksInitial()) {
    on<AboutBooksEvent>((event, emit) {});
  }
}
