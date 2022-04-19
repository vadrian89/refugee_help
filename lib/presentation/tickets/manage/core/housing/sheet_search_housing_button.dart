import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/loading_search_button.dart';

class SheetSearchHousingButton extends StatelessWidget {
  final ListHousingCubit bloc;
  final VoidCallback onSearch;

  const SheetSearchHousingButton({Key? key, required this.onSearch, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ListHousingCubit, ListHousingState>(
        bloc: bloc,
        builder: (context, state) {
          final isSearching = state.maybeWhen(orElse: () => false, loading: (_) => true);
          return LoadingSearchButton(
            isSearching: isSearching,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              isSearching ? null : onSearch();
            },
          );
        },
      );
}
