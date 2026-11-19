import 'package:flutter/material.dart';
import 'package:cognitive_app/app/theme/app_colors.dart';
import 'package:cognitive_app/app/theme/app_dimensions.dart';
import 'package:cognitive_app/core/widgets/app_button.dart';

/// Vista de error estandar con icono, mensaje y boton opcional para reintentar.
class AppError extends StatelessWidget {
  const AppError({
    required this.message,
    this.onRetry,
    this.retryLabel = 'Reintentar',
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spaceL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.error,
              size: 48,
            ),
            const SizedBox(height: AppDimensions.spaceM),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppDimensions.spaceL),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: AppButton(
                  label: retryLabel,
                  icon: Icons.refresh_rounded,
                  onPressed: onRetry,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
