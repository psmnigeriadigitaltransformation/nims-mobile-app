import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/domain/models/movement_category.dart';

extension RemoteUserExtension on RemoteUser {
  DomainUser toDomain(String deviceSerialNo) {
    return DomainUser(
      id: null,
      userId: userId,
      guid: guid,
      roleCode: roleCode,
      role: role,
      title: title,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      isActive: isActive,
      isDeleted: isDeleted,
      priority: priority,
      geoPrivileges: geoPrivileges,
      lspPrivileges: lspPrivileges,
      deviceSerialNo: deviceSerialNo,
    );
  }
}

extension RemotePlatformExtension on RemotePlatform {
  DomainPlatform toDomain(String userId) {
    return DomainPlatform(id: null, userId: userId, name: name);
  }
}

extension RemoteLspExtension on RemoteLsp {
  DomainLsp toDomain(String userId) {
    return DomainLsp(
      id: null,
      userId: userId,
      pick: pick,
      lspId: lspId,
      lspCode: lspCode,
      fullName: fullName,
      guid: guid,
      display: display,
    );
  }
}

extension RemoteSystemPrivilegeExtension on RemoteSystemPrivilege {
  DomainSystemPrivilege toDomain(String userId) {
    return DomainSystemPrivilege(id: null, userId: userId, name: name);
  }
}

extension RemotePrivilegeExtension on RemotePrivilege {
  DomainPrivilege toDomain(int systemPrivilegeId) {
    return DomainPrivilege(
      id: null,
      systemPrivilegeId: systemPrivilegeId,
      rider: rider,
    );
  }
}

extension RemoteFacilityExtension on RemoteFacility {
  DomainFacility toDomain(String type) {
    return DomainFacility(
      id: null,
      facilityId: facilityId,
      facilityCode: facilityCode,
      labCode: labCode,
      facilityName: facilityName,
      geoString: geoString,
      type: type,
    );
  }
}

extension RemoteSampleTypeExtension on RemoteSampleType {
  DomainSampleType toDomain() {
    return DomainSampleType(
      id: null,
      sampleId: id,
      pick: pick,
      fullName: fullName,
    );
  }
}

extension RemoteLocationExtension on RemoteLocation {
  DomainLocation toDomain() {
    return DomainLocation(
      id: null,
      locationId: locationId,
      pick: pick,
      location: location,
      created: created,
    );
  }
}

extension RemoteMovementTypeExtension on RemoteMovementType {
  DomainMovementType toDomain(MovementTypeCategory? category) {
    return DomainMovementType(
      id: null,
      typeId: typeId,
      pick: pick,
      movement: movement,
      created: created,
      category: category?.name,
    );
  }
}

extension RemoteETokenDataExtension on RemoteETokenData {
  DomainETokenData toDomain() {
    return DomainETokenData(id: null, etokenId: etokenId, serialNo: serialNo);
  }
}
