import '../../constants/constants.dart';

class CustomButton extends StatelessWidget {
  final Widget wedRow;
  final Color textColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  const CustomButton({
    Key? key,
    required this.wedRow,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor, width: 2),
        ),
        primary: backgroundColor,
        minimumSize: Size(context.screenWidth, 50),
      ),
      child: wedRow,
    ).box.height(56).width(context.screenWidth).make();
  }
}

TextField MyTextField({
  keyboardType,
  controller,
  obscureText,
  hintText,
  suffixIcon,
  maxLines,
  readOnly,
  Radius,
}) {
  return TextField(
    readOnly: readOnly,
    keyboardType: keyboardType,
    controller: controller,
    style: const TextStyle(
      fontFamily: MontserratLight,
      fontSize: 14,
      color: blackColor,
    ),
    maxLines: maxLines,
    obscureText: obscureText,
    decoration: InputDecoration(
      filled: true,
      fillColor: whiteColor,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontFamily: MontserratLight,
        fontSize: 14,
        color: greyColor,
      ),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius),
        borderSide: BorderSide(
          width: 0.5,
          color: greyColor.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.blue,
        ),
      ),
    ),
  );
}
