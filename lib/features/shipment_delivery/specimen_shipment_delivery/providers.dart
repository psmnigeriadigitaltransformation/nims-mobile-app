import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/features/shipment_delivery/specimen_shipment_delivery/specimen_delivery_approval_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_delivery/specimen_shipment_delivery/specimen_delivery_approval_screen_state_notifier.dart';

final specimenDeliveryApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
        SpecimenDeliveryApprovalScreenStateNotifier,
        SpecimenDeliveryApprovalScreenState,
        ({
          DomainShipmentRoute route,
          List<DomainShipment> shipments,
        })>(SpecimenDeliveryApprovalScreenStateNotifier.new);
