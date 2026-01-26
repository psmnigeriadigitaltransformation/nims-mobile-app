import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_screen.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';
import 'package:nims_mobile_app/core/ui/theme/text_styles.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_primary_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_quick_action_card.dart';
import 'package:nims_mobile_app/core/services/remote/models/login_response.dart';
import 'package:nims_mobile_app/features/dashboard/domain/quick_action.dart';
import 'package:nims_mobile_app/features/dashboard/domain/route_type.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/select_movement_type_bottom_sheet_dialog.dart';
import 'package:nims_mobile_app/features/profile/providers.dart';

import '../../../../app/route_name+path+params.dart';
import '../../../../core/ui/screens/nims_base_screen.dart';
import '../../../../core/ui/widgets/nims_route_card.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final AsyncValue<DomainUser?> userAsyncValue = ref.watch(userProvider);

    return userAsyncValue.when(
      loading: () => Container(
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
      error: (err, stack) => Text('Error: $err'),
      data: (user) {
        return NIMSBaseScreen(
          header: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                SizedBox(height: 24),
                Center(
                  child:
                      /// -------------------------------
                      /// INITIALS AVATAR
                      /// -------------------------------
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsetsGeometry.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(55),
                              border: Border.fromBorderSide(
                                BorderSide(
                                  width: 0.5,
                                  color: Theme.of(context).colorScheme.outline,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                              ),
                            ),
                            child: Text("${user?.firstName?.characters.first}${user?.lastName?.characters.first}"),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "${user?.title} ${user?.firstName} ${user?.middleName} ${user?.lastName}"
                                .replaceAll("  ", ""),
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                ),
              ],
            ),
          ),
          body: ListView(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            controller: ScrollController(),
            shrinkWrap: true,
            children: [
              Text("$user", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),

          /// -------------------------------
          /// NEW PICK UP BUTTON
          /// -------------------------------
          bottom: null,
        );
      },
    );
  }
}
