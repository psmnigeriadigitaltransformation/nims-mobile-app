import 'package:nims_mobile_app/core/domain/models/user.dart' as domain_user;
import 'package:nims_mobile_app/core/services/remote/models/login_response.dart'
    as login_response;

import 'package:nims_mobile_app/core/domain/models/platform.dart' as domain_platform;
import 'package:nims_mobile_app/core/domain/models/system_privilege.dart' as domain_system_privilege;
import 'package:nims_mobile_app/core/domain/models/privilege.dart' as domain_privilege;
import 'package:nims_mobile_app/core/domain/models/lsp.dart' as domain_lsp;

import 'package:nims_mobile_app/core/services/remote/models/facilities_response.dart' as facilities_response;
import 'package:nims_mobile_app/core/domain/models/facility.dart' as domain_facility;

import 'package:nims_mobile_app/core/services/remote/models/sample_types_response.dart' as sample_type_response;
import 'package:nims_mobile_app/core/domain/models/sample_type.dart' as domain_sample_type;

import 'package:nims_mobile_app/core/services/remote/models/locations_response.dart' as location_response;
import 'package:nims_mobile_app/core/domain/models/location.dart' as domain_location;

import 'package:nims_mobile_app/core/services/remote/models/movement_types_response.dart' as movement_type_response;
import 'package:nims_mobile_app/core/domain/models/movement_type.dart' as domain_movement_type;

import 'package:nims_mobile_app/core/services/remote/models/etoken_response.dart' as etoken_response;
import 'package:nims_mobile_app/core/domain/models/etoken_data.dart' as domain_etoken_data;

import 'package:nims_mobile_app/core/services/remote/models/request/create_manifest_request_body.dart' as create_manifest_request_body;
import 'package:nims_mobile_app/core/domain/models/manifest.dart' as domain_manifest;
import 'package:nims_mobile_app/core/domain/models/sample.dart' as domain_sample;

import 'package:nims_mobile_app/core/services/remote/models/request/create_specimen_shipment_route_request_body.dart' as create_shipment_route_request_body;
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart' as domain_route;

import 'package:nims_mobile_app/core/domain/models/shipment.dart' as domain_shipment;
import 'package:nims_mobile_app/core/domain/models/approval.dart' as domain_approval;
import 'package:nims_mobile_app/core/domain/models/result.dart' as domain_result;

import 'package:nims_mobile_app/core/services/remote/models/results_response.dart' as available_results_response;

typedef RemoteUser = login_response.User;
typedef DomainUser = domain_user.User;

typedef RemotePlatform = login_response.PlatformItem;
typedef DomainPlatform = domain_platform.Platform;

typedef RemoteSystemPrivilege = login_response.SystemPrivilege;
typedef DomainSystemPrivilege = domain_system_privilege.SystemPrivilege;

typedef RemotePrivilege = login_response.Privileges;
typedef DomainPrivilege = domain_privilege.Privilege;

typedef RemoteLsp = login_response.Lsp;
typedef DomainLsp = domain_lsp.Lsp;

typedef RemoteFacility = facilities_response.FacilityItem;
typedef DomainFacility = domain_facility.Facility;

typedef RemoteSampleType = sample_type_response.SampleTypeItem;
typedef DomainSampleType = domain_sample_type.SampleType;

typedef RemoteLocation = location_response.LocationItem;
typedef DomainLocation = domain_location.Location;

typedef RemoteMovementType = movement_type_response.MovementTypeItem;
typedef DomainMovementType = domain_movement_type.MovementType;

typedef RemoteETokenData = etoken_response.ETokenData;
typedef DomainETokenData = domain_etoken_data.ETokenData;

typedef RemoteManifest = create_manifest_request_body.ManifestRequestItem;
typedef DomainManifest = domain_manifest.Manifest;

typedef RemoteSample = create_manifest_request_body.ManifestSampleRequest;
typedef DomainSample = domain_sample.Sample;

typedef RemoteShipmentRoute = create_shipment_route_request_body.CreateSpecimenShipmentRouteRequest;
typedef DomainShipmentRoute = domain_route.ShipmentRoute;

typedef RemoteShipment = create_shipment_route_request_body.Shipment;
typedef DomainShipment = domain_shipment.Shipment;

typedef RemoteApproval = create_shipment_route_request_body.Approval;
typedef DomainApproval = domain_approval.Approval;

typedef RemoteAvailableResultItem = available_results_response.ResultItem;
typedef DomainResult = domain_result.LabResult;
