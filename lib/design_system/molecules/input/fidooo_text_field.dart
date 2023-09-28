import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:login/design_system/tokens/fidooo_colors.dart';
import 'package:login/design_system/tokens/fidooo_typography.dart';

class FidoooTextField extends StatefulWidget {
  const FidoooTextField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.password = false,
    this.label,
    this.validators,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String formField;
  final String? initialValue;
  final bool enabled;
  final bool password;
  final String? label;
  final List<String? Function(String?)>? validators;
  final TextInputType keyboardType;

  @override
  State<FidoooTextField> createState() => _FidoooTextFieldState();
}

class _FidoooTextFieldState extends State<FidoooTextField> {
  late FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isObscured = widget.password;
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      name: widget.formField,
      validator: (value) {
        if (widget.validators != null) {
          for (final validator in widget.validators!) {
            final error = validator(value);
            if (error != null) {
              return error;
            }
          }
        }
        return null;
      },
      builder: (FormFieldState field) {
        return SizedBox(
          width: 360,
          child: TextField(
            style: const FidoooTypography.bodyLarge(
              color: FidoooColors.greyLight10,
            ),
            cursorColor: FidoooColors.primaryColor,
            obscureText: _isObscured,
            enabled: widget.enabled,
            onChanged: (value) {
              field.didChange(value);
            },
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 12,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: widget.label,
              labelStyle: const FidoooTypography.bodyLarge(
                color: FidoooColors.greyLight6,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: FidoooColors.greyLight10,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: FidoooColors.greyLight10,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: FidoooColors.error,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              errorStyle: const FidoooTypography.bodyLarge(
                color: FidoooColors.error,
              ),
              errorMaxLines: 2,
              errorText: field.errorText,
            ),
            onTapOutside: (e) {
              _focusNode.unfocus();
            },
            onEditingComplete: () {
              _focusNode.unfocus();
            },
            onSubmitted: (value) {
              _focusNode.unfocus();
            },
          ),
        );
      },
    );
  }
}
