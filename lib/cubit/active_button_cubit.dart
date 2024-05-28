import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxidriver/demo_data/all_data.dart';
part 'active_button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit()
      : super(ButtonState(isEnabled: false, buttonColor: Color(0xFF4D4D4D), cards: []
  ));

  void updateButtonState(TextEditingController numberController,
      TextEditingController dateController,
      TextEditingController phoneNumberController) {
    bool isEnabled = numberController.text.length == 19 &&
        _isDateValid(dateController.text) &&
        phoneNumberController.text.length == 17;

    emit(ButtonState(
        isEnabled: isEnabled,cards: [],
        buttonColor: isEnabled ? Color(0xFFFFD600) : Color(0xFF4D4D4D),));
  }

  bool _isDateValid(String date) {
    if (date.length != 5 || date[2] != '/') {
      return false;
    }
    int month;
    int year;

    try {
      month = int.parse(date.substring(0, 2));
      year = int.parse('20' + date.substring(3, 5));
    } catch (e) {
      return false;
    }

    if (month < 1 || month > 12) {
      return false;
    }

    DateTime now = DateTime.now();
    if (year < now.year) {
      return false;
    }
    if (year == now.year && month < now.month) {
      return false;
    }

    return true;
  }


  void addNewCardToCards(
      TextEditingController numberController,
      TextEditingController dateController,
      TextEditingController phoneNumberController) {
    myCards.add(CardInfo(
        cardNumber: int.parse(numberController.text.replaceAll(' ', '')),
        dueDate: _parsingToDateTime(dateController.text),
        balance: 220456,
        phoneNumber: phoneNumberController.text,
        ownerFio: myCards[0].ownerFio));
  }

  DateTime _parsingToDateTime(String dueDate) {
    int month;
    int year;
    month = int.parse(dueDate.substring(0, 2));
    year = int.parse('20' + dueDate.substring(3, 5));
    DateTime date = DateTime(year,month);
    return date;
  }

  void fetchCards() {
    emit(ButtonState(
      isEnabled: state.isEnabled,
      buttonColor: state.buttonColor,
      cards: myCards,
    ));
  }
}