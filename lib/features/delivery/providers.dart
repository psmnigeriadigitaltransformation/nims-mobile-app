import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/model/delivery_approval_screen_state.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/model/result_delivery_approval_screen_state.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/notifier/specimen_delivery_approval_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/notifier/result_delivery_approval_screen_state_notifier.dart';

final specimenDeliveryApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
        SpecimenDeliveryApprovalScreenStateNotifier,
        SpecimenDeliveryApprovalScreenState,
        ({
          DomainShipmentRoute route,
          List<DomainShipment> shipments,
        })>(SpecimenDeliveryApprovalScreenStateNotifier.new);

final resultDeliveryApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
        ResultDeliveryApprovalScreenStateNotifier,
        ResultDeliveryApprovalScreenState,
        ({
          ShipmentRoute route,
          DomainShipment shipment,
        })>(ResultDeliveryApprovalScreenStateNotifier.new);
