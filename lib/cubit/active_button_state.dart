part of 'active_button_cubit.dart';

class ButtonState {
  final bool isEnabled;
  final Color buttonColor;
  final List<CardInfo> cards;

  ButtonState({
    required this.isEnabled,
    required this.buttonColor,
    required this.cards,
  });
}