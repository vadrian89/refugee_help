import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';

import 'core/ticket_category_list_tile.dart';

class TicketCategorySelector extends StatelessWidget {
  const TicketCategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TicketCategoryListTile(
                icon: MdiIcons.car,
                label: "transport_tickets".tr(),
                onPressed: () => context.read<RootRouterCubit>().goToTickets(
                      type: TicketTypeModel.transport(),
                    ),
              ),
              TicketCategoryListTile(
                icon: MdiIcons.homeGroup,
                label: "housing_tickets".tr(),
              ),
            ],
          ),
        ),
      );
}
