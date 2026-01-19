import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/model/delivery_approval_screen_state.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/model/result_delivery_approval_screen_state.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/notifier/delivery_approval_screen_state_notifier.dart';
import 'package:nims_mobile_app/features/delivery/presentation/ui/notifier/result_delivery_approval_screen_state_notifier.dart';

final deliveryApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
        DeliveryApprovalScreenStateNotifier,
        DeliveryApprovalScreenState,
        ({
          DomainMovementType movementType,
          DomainFacility destinationFacility,
          List<DomainShipment> shipments,
          String routeNo,
        })>(DeliveryApprovalScreenStateNotifier.new);

final resultDeliveryApprovalScreenStateNotifierProvider =
    AutoDisposeNotifierProviderFamily<
        ResultDeliveryApprovalScreenStateNotifier,
        ResultDeliveryApprovalScreenState,
        ({
          ShipmentRoute route,
          List<Shipment> shipments,
          Facility destinationFacility,
          List<String> sampleCodes,
        })>(ResultDeliveryApprovalScreenStateNotifier.new);
