import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleInput extends StatefulWidget {
  SimpleInput({
    super.key,
    required this.titleInput,
    this.isPassword = false,
    this.obscureText = true,
    this.controller,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.colorIcon,
    this.onTap,
    this.labelText,
  });
  final String titleInput;
  final bool isPassword;
  bool obscureText;
  final TextEditingController? controller;
  final FocusNode? nextFocusNode;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Color? colorIcon;
  final Function()? onTap;
  final String? labelText;

  @override
  State<SimpleInput> createState() => _SimpleInputState();
}

class _SimpleInputState extends State<SimpleInput> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.nextFocusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.nextFocusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 1,
          text: TextSpan(
            text: '',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            children: widget.titleInput.contains('*')
                ? [
                    TextSpan(
                      style: AppFonts.regular(
                        14,
                        AppColors.grey500,
                      ),
                      text: widget.titleInput
                          .substring(0, widget.titleInput.indexOf('*')),
                    ),
                    const TextSpan(
                      text: '*',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.red0,
                      ),
                    ),
                    TextSpan(
                      text: widget.titleInput
                          .substring(widget.titleInput.indexOf('*') + 1),
                      style: AppFonts.light(
                        1,
                        AppColors.grey500,
                      ),
                    ),
                  ]
                : [
                    TextSpan(
                      text: widget.titleInput,
                      style: AppFonts.regular(
                        16,
                        AppColors.grey500,
                      ),
                    ),
                  ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          focusNode: _focusNode,
          controller: widget.controller,
          onFieldSubmitted: (value) {
            if (widget.nextFocusNode != null) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            }

            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!(value);
            }
          },
          obscureText: widget.isPassword ? widget.obscureText : false,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: AppFonts.quicksandMedium500(
                16, const Color(0xFF212121).withOpacity(0.6)),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.kPrimary),
            ),
            errorStyle: AppFonts.light(12, AppColors.kPrimary).copyWith(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Color(0xffB8B8D2)),
            ),
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      top: 16,
                      bottom: 16,
                    ),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.obscureText = !widget.obscureText;
                          });
                        },
                        child: Image.asset(
                          !widget.obscureText
                              ? AppImages.iconEye
                              : AppImages.iconEyeClose,
                          width: 18,
                          height: 16,
                          fit: BoxFit.fitWidth,
                          color: widget.colorIcon ?? const Color(0xff1F1F39),
                        )),
                  )
                : const SizedBox.shrink(),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 16,
            ),
            contentPadding: const EdgeInsets.only(
              left: 20,
              bottom: 15,
              top: 15,
            ),
          ),
        ),
      ],
    );
  }
}
