import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/loading_search_button.dart';

class SheetSearchTransportButton extends StatelessWidget {
  final ListTransportCubit bloc;
  final VoidCallback onSearch;

  const SheetSearchTransportButton({Key? key, required this.onSearch, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ListTransportCubit, ListTransportState>(
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
