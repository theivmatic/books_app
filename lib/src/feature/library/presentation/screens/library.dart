import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:books_app/src/feature/library/presentation/screens/add_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Твоя библиотека',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (context) => const AddCardScreen(),
            ),
          );
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: BlocBuilder<CardBloc, CardBlocState>(
          builder: (context, state) {
            if (state is CardBlocInitialState) {
              context.read<CardBloc>().add(
                    const FetchCardsEvent(),
                  );
            }
            if (state is DisplayCards) {
              if (state.card.isEmpty) {
                return const Center(
                  child:
                      Text('Нажмите на кнопку сверху, чтобы добавить карточку'),
                );
              } else {
                return const Center(
              child: Text('sss'),
            );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
