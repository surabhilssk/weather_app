import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherData.dart';
import 'package:weather_app/services/api_services.dart';

class OtherWeatherDetails extends StatefulWidget {
  const OtherWeatherDetails({
    super.key,
  });

  @override
  State<OtherWeatherDetails> createState() => _OtherWeatherDetailsState();
}

class _OtherWeatherDetailsState extends State<OtherWeatherDetails> {
  //declared the variables with initial values
  var windSpeed = "0";
  var humidity = "0";
  var rain = "0";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //wind speed indicator
        Column(
          children: [
            const Icon(Icons.air),
            const SizedBox(
              height: 10,
            ),
            Text(windSpeed),
          ],
        ),
        //humidity percentage indicator
        Column(
          children: [
            const Icon(Icons.water_drop_outlined),
            const SizedBox(
              height: 10,
            ),
            Text(humidity),
          ],
        ),
        //rain percentage indicator
        Column(
          children: [
            const Icon(Icons.beach_access_outlined),
            const SizedBox(
              height: 10,
            ),
            Text(rain),
          ],
        ),
      ],
    );
  }
}
