import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../services/api_services.dart';
import '../widgets/otherdetails_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //text controller for getting text from textformfield
  TextEditingController textController = TextEditingController();

  //declaring initial values
  var cityName = 'London';
  var weather = "Cloudy";
  var assetName = "assets/cloudy.json";
  var temperature = "20";
  var feelsLike = "18";

  //function performed when Search button is pressed
  void onPressed() async {
    final city = textController.text;
    //function for getting the weather and storing in result
    final result = await getWeather(cityName: city);
    //rebuilding the entire app so that changes can be made accordingly
    setState(() {
      cityName = result.name!;
      weather = result.weather![0].main as String;
      temperature = result.main!.temp!.toStringAsFixed(2);
      feelsLike = result.main!.feelsLike!.toStringAsFixed(2);
    });
  }

  //initial state of the app
  @override
  void initState() {
    super.initState();
    cityName = "London";
    weather = "Cloudy";
    assetName = "assets/cloudy.json";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                //app name
                Text(
                  'Weathery App',
                  style: GoogleFonts.lexend(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                //city search
                TextFormField(
                  style: GoogleFonts
                      .lexend(), //used for changing the font using GoogleFonts
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Search for a location",
                  ),
                ),
                const SizedBox(height: 20),
                //button for searching the city
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    textStyle: GoogleFonts.lexend(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  ),
                  icon: const Icon(Icons.search),
                  label: const Text('Search'),
                  onPressed: onPressed,
                ),
              ],
            ),
            Column(
              children: [
                //city name
                Text(
                  cityName,
                  style: GoogleFonts.lexend(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                //weather condition
                Text(
                  weather,
                  style: GoogleFonts.lexend(
                    fontSize: 20,
                  ),
                ),
                //weather animation
                Lottie.asset(assetName),
                const SizedBox(
                  height: 50,
                ),
                //temperature & feel like temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "$temperature°C",
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "$feelsLike°C",
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                //functions for other weather details like windspeed, humidity and rain percentage
                const OtherWeatherDetails(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
