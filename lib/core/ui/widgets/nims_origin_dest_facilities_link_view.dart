import 'package:flutter/material.dart';

class NIMSOriginDestinationLinkView extends StatelessWidget {
  final String origin;
  final String destination;

  const NIMSOriginDestinationLinkView({
    super.key,
    required this.origin,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(left: 2.5),
                child: Image.asset(
                  "lib/core/ui/icons/ic_origin_location.png",
                  width: 16,
                  height: 16,
                ),
              ),
              SizedBox(width: 16),
              Text(origin, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              child: Container(
                width: 1,
                color: Theme.of(context).colorScheme.secondary,
                height: 16,
              ),
            ),
          ),
          Row(
            children: [
              Image.asset(
                "lib/core/ui/icons/ic_destination_location.png",
                width: 21,
                height: 18,
              ),
              SizedBox(width: 16),
              Text(destination, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
