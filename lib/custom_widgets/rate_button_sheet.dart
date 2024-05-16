import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxidriver/custom_widgets/container_button.dart';
import 'package:taxidriver/custom_widgets/text_container.dart';

Future rateButtonSheet(BuildContext context, VoidCallback onPressed,) async {
  await showModalBottomSheet(
    isDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        height: 290,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 17, right: 29),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2126),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 11),
            SvgPicture.asset("assets/icons/line.svg"),
            const SizedBox(height: 30),
            const TextContainer(
              textAlign: TextAlign.center,
              "Как вам поездка?",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            const SizedBox(height: 9),
            const TextContainer(
              textAlign: TextAlign.center,
              "Оцените вашего пассажира для аналитики\nи формирования его рейтинга",
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
            const SizedBox(height: 22),
            StarRating(
              rating: 3, // Set initial rating
              onRatingChanged: (rating) {
              },
            ),
            const SizedBox(height: 35),
            buttonContainer(
              fontSize: 22,
              textColor: Colors.black,
              fontWeight: FontWeight.w800,
              containerColor: Color(0xFFFFD600),
              text: ("ОЦЕНИТЬ ПОЕЗДКУ"),
              onTap: () {
                Navigator.maybePop(builderContext);
              },
            ),
            const Spacer()
          ],
        ),
      );
    },
  );
}
class StarRating extends StatefulWidget {
  final int rating;
  final void Function(int) onRatingChanged;

  const StarRating({Key? key, required this.rating, required this.onRatingChanged}) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentRating = index + 1;
                  widget.onRatingChanged(_currentRating);
                });
              },
              child: SvgPicture.asset("assets/icons/star.svg",
                width: 35,
                height: 35,
                color: index < _currentRating ? Color(0xFFFFBC36) : Color(0xFFCACACF),
              ),
            ),
            SizedBox(width: 10), // Add a SizedBox after each SvgPicture.asset
          ],
        );
      }),
    );

  }
}
