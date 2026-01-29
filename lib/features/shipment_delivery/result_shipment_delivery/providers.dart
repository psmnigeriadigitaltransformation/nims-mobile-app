import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/features/shipment_delivery/result_shipment_delivery/result_delivery_approval_screen_state.dart';
import 'package:nims_mobile_app/features/shipment_delivery/result_shipment_delivery/result_delivery_approval_screen_state_notifier.dart';

final resultDeliveryApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
        ResultDeliveryApprovalScreenStateNotifier,
        ResultDeliveryApprovalScreenState,
        ({
          ShipmentRoute route,
          DomainShipment shipment,
        })>(ResultDeliveryApprovalScreenStateNotifier.new);
