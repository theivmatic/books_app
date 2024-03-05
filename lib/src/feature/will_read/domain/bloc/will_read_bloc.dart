import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'will_read_event.dart';
part 'will_read_state.dart';

class WillReadBloc extends Bloc<WillReadBlocEvent, WillReadBlocState> {
  WillReadBloc() : super(WillReadBlocInitialState()) {
    var bookCards = <BookCard>[];
    on<DisplayWillReadBooks>((event, emit) {
      bookCards = event.willReadBooks ?? bookCards;
      
      emit(
        WillReadBlocInitialState(),
      );
      emit(
        WillReadBlocLoadedState(willReadBooks: bookCards),
      );
    });
  }
}
