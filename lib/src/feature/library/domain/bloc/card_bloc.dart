import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardBlocEvent, CardBlocState> {
  CardBloc() : super(CardBlocInitialState()) {
    on<CardBlocEvent>((event, emit) {});
  }
}
