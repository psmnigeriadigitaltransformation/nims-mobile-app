import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../core/ui/widgets/nims_signature_pad.dart';

class SignatureDialog extends StatefulWidget {
  final Future<void> Function(String signatureBase64) onFinish;

  const SignatureDialog({
    super.key,
    required this.onFinish,
  });

  @override
  State<SignatureDialog> createState() => _SignatureDialogState();
}

class _SignatureDialogState extends State<SignatureDialog> {
  final GlobalKey<NIMSSignaturePadState> signatureKey = GlobalKey();
  bool _hasSigned = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => context.pop(),
                ),
                Expanded(
                  child: Text(
                    "Sign to Approve",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),

            const SizedBox(height: 16),

            /// Instructions
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withAlpha(100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Please sign below to confirm the shipment approval",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Signature Pad
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withAlpha(100),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: NIMSSignaturePad(
                  key: signatureKey,
                  strokeColor: Colors.black,
                  backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                  onSignatureStart: () {
                    setState(() {
                      _hasSigned = true;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Clear Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  signatureKey.currentState?.clear();
                  setState(() {
                    _hasSigned = false;
                  });
                },
                icon: Icon(
                  Icons.refresh_rounded,
                  size: 18,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  "Clear",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Finish Button
            SizedBox(
              width: double.infinity,
              child: NIMSPrimaryButton(
                text: "Finish",
                loading: _isLoading,
                onPressed: () async {
                  setState(() => _isLoading = true);

                  final signatureBase64 = await signatureKey.currentState?.toBase64();

                  if (signatureBase64 != null && context.mounted) {
                    await widget.onFinish(signatureBase64);
                    if (context.mounted) {
                      context.pop();
                    }
                  } else {
                    setState(() => _isLoading = false);
                  }
                },
                enabled: _hasSigned && !_isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
