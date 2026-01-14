import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

class NIMSFacilityCard extends StatelessWidget {
  final DomainFacility facility;

  const NIMSFacilityCard({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: 0.5,
              ),
            ),
          ),
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 16,
            bottom: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                facility.facilityName ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      facility.geoString ?? "",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
