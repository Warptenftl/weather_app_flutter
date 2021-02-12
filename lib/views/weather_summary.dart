import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherCondition condition;
  final double temp;
  final double feelsLike;
  final bool isdayTime;

  WeatherSummary(
      {Key key,
        @required this.condition,
        @required this.temp,
        @required this.feelsLike,
        @required this.isdayTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              '${_formatTemperature(this.temp)}°ᶜ',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like ${_formatTemperature(this.feelsLike)}°ᶜ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        _mapWeatherConditionToImage(this.condition, this.isdayTime),
      ]),
    );
  }

  String _formatTemperature(double t) {
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }

  Widget _mapWeatherConditionToImage(
      WeatherCondition condition, bool isDayTime) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
      // image = Image.asset('assets/images/thunder_storm.png');
        image = Image.network(
            "https://www.freeiconspng.com/uploads/thunderstorm-icon-0.png");

        break;
      case WeatherCondition.heavyCloud:
      // image = Image.asset('assets/images/cloudy.png');
        image = Image.network(
            'https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-512.png');
        break;
      case WeatherCondition.lightCloud:
        isDayTime
            ? image = Image.network(
            'https://lh3.googleusercontent.com/proxy/00gnNlgwcmOpoMRXLDLOg2hz8Q8xJ6ShxOLnSS4YqI8SJtgeRmzvaiH94k1hcwCJm1U1UhpZlU18YWu8QBAIAyh3l4-1IyspW88JC7LPv8vly11W1KqRkyu3MRhlQ63ULioVQgSmYz9kTktc-tDLKbo')
            : image = Image.network(
            'https://cdn.onlinewebfonts.com/svg/img_7362.png');
        // isDayTime
        //     ? image = Image.asset('assets/images/light_cloud.png')
        //     : image = Image.asset('assets/images/light_cloud-night.png');
        break;
      case WeatherCondition.drizzle:
        image = Image.network(
            'https://image.flaticon.com/icons/png/512/2412/2412691.png');
        break;
      case WeatherCondition.mist:
      // image = Image.asset('assets/images/drizzle.png');
        image = Image.network(
            'https://img2.pngio.com/cloud-dark-fog-icon-vector-stylish-weather-icons-softiconscom-foggy-weather-png-256_256.png');
        break;
      case WeatherCondition.clear:
      // isDayTime
      //     ? image = Image.asset('assets/images/clear.png')
      //     : image = Image.asset('assets/images/clear-night.png');

        isDayTime
            ? image = Image.network(
            'https://www.freeiconspng.com/thumbs/cloud-icon/cloud-icon-17.png')
            : image = Image.asset('assets/images/clear-night.png');
        break;
      case WeatherCondition.fog:
        image = Image.asset('assets/images/fog.png');
        break;
      case WeatherCondition.snow:
        image = Image.asset('assets/images/snow.png');
        break;
      case WeatherCondition.rain:
        image = Image.asset('assets/images/rain.png');
        break;
      case WeatherCondition.atmosphere:
        image = Image.asset('assets/images/fog.png');
        break;

      default:
        image = Image.asset('assets/images/unknown.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}
