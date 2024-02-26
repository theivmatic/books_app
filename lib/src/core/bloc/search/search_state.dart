part of 'search_bloc.dart';

sealed class SearchBlocState {}

final class SearchBlocInitialState extends SearchBlocState {}

final class SearchBlocLoadingState extends SearchBlocState {}

final class SearchBlocLoadedState extends SearchBlocState {}
