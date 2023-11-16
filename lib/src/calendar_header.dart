import 'package:flutter/material.dart';
import 'default_styles.dart' show defaultHeaderTextStyle;

class CalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  CalendarHeader(
      {required this.headerTitle,
      this.headerMargin,
      required this.showHeader,
      this.headerTextStyle,
      this.showHeaderButtons = true,
      this.headerIconColor,
      this.leftButtonIcon,
      this.rightButtonIcon,
      required this.onLeftButtonPressed,
      required this.onRightButtonPressed,
      this.onHeaderTitlePressed})
      : isTitleTouchable = onHeaderTitlePressed != null;

  final String headerTitle;
  final EdgeInsetsGeometry? headerMargin;
  final bool showHeader;
  final TextStyle? headerTextStyle;
  final bool showHeaderButtons;
  final Color? headerIconColor;
  final Widget? leftButtonIcon;
  final Widget? rightButtonIcon;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isTitleTouchable;
  final VoidCallback? onHeaderTitlePressed;

  TextStyle get getTextStyle => headerTextStyle ?? defaultHeaderTextStyle;

  Widget _leftButton() => InkWell(
        onTap: onLeftButtonPressed,
        focusColor: Colors.transparent,
        // onPressed: onLeftButtonPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16, bottom: 8, right: 8),
          child: leftButtonIcon ?? Icon(Icons.chevron_left, color: headerIconColor),
        ),
      );

  Widget _rightButton() => InkWell(
        focusColor: Colors.transparent,
        onTap: onRightButtonPressed,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 16, bottom: 8, left: 8),
          child: rightButtonIcon ?? Icon(Icons.chevron_right, color: headerIconColor),
        ),
      );

  Widget _headerTouchable() => TextButton(
        onPressed: onHeaderTitlePressed,
        child: Text(
          headerTitle,
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) => showHeader
      ? Container(
          margin: headerMargin,
          child: DefaultTextStyle(
              style: getTextStyle,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                showHeaderButtons ? _leftButton() : Container(),
                isTitleTouchable ? _headerTouchable() : Text(headerTitle, style: getTextStyle),
                showHeaderButtons ? _rightButton() : Container(),
              ])),
        )
      : Container();
}
