import 'package:flutter/material.dart';
import 'package:cognitive_app/app/theme/app_colors.dart';
import 'package:cognitive_app/app/theme/app_dimensions.dart';

/// Tamanos de boton definidos en la Seccion 5.3 del Design System V1.0.
enum AppButtonSize {
  small(AppDimensions.smallButtonHeight),
  standard(AppDimensions.buttonHeight),
  gameResponse(AppDimensions.gameButtonHeight);

  const AppButtonSize(this.height);
  final double height;
}

/// Boton del UI Kit con microinteraccion Scale 0.97 (120 ms) y soporte de variantes.
class AppButton extends StatefulWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.isSecondary = false,
    this.size = AppButtonSize.standard,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final bool isSecondary;
  final AppButtonSize size;
  final IconData? icon;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  void _setPressed(bool value) {
    if (widget.onPressed == null || widget.isLoading) return;
    if (_isPressed != value) {
      setState(() => _isPressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = widget.isLoading ? null : widget.onPressed;

    final content = widget.isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: Colors.white,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: AppDimensions.iconSizeS),
                const SizedBox(width: AppDimensions.spacing2),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );

    Widget button;
    if (widget.isOutlined) {
      button = OutlinedButton(
        onPressed: effectiveOnPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size.fromHeight(widget.size.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
          ),
        ),
        child: content,
      );
    } else {
      button = ElevatedButton(
        onPressed: effectiveOnPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              widget.isSecondary ? AppColors.secondary : AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: Size.fromHeight(widget.size.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
          ),
        ),
        child: content,
      );
    }

    return Listener(
      onPointerDown: (_) => _setPressed(true),
      onPointerUp: (_) => _setPressed(false),
      onPointerCancel: (_) => _setPressed(false),
      child: AnimatedScale(
        scale: _isPressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        child: button,
      ),
    );
  }
}
