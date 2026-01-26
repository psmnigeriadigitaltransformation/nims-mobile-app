import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

class NIMSSelectedResultCard extends StatelessWidget {
  final DomainResult result;

  const NIMSSelectedResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                child: Text(
                  result.patientCode,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(width: 24),
              Text(
                result.sampleCode,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              Text(result.age, style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              Text(result.gender, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
