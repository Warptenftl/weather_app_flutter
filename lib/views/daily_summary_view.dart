import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/temperature_convert.dart';

class DailySummaryView extends StatelessWidget {
  final Weather weather;

  DailySummaryView({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayOfWeek =
    toBeginningOfSentenceCase(DateFormat('EEE').format(this.weather.date));

    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(dayOfWeek ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              Text(
                  "${TemperatureConvert.kelvinToCelsius(this.weather.temp).round().toString()}°",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Container(
                    alignment: Alignment.center,
                    child: _mapWeatherConditionToImage(this.weather.condition)))
          ],
        ));
  }

  Widget _mapWeatherConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
      // image = Image.asset('assets/images/thunder_storm_small.png');
        image = Image.network("https://www.freeiconspng.com/uploads/thunderstorm-icon-0.png");
        break;
      case WeatherCondition.heavyCloud:
      // image = Image.asset('assets/images/cloudy_small.png');
        image = Image.network('https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather07-512.png');
        break;
      case WeatherCondition.lightCloud:
      // image = Image.asset('assets/images/light_cloud_small.png');
        image = Image.network('https://lh3.googleusercontent.com/proxy/00gnNlgwcmOpoMRXLDLOg2hz8Q8xJ6ShxOLnSS4YqI8SJtgeRmzvaiH94k1hcwCJm1U1UhpZlU18YWu8QBAIAyh3l4-1IyspW88JC7LPv8vly11W1KqRkyu3MRhlQ63ULioVQgSmYz9kTktc-tDLKbo');
        break;
      case WeatherCondition.drizzle:
        image = Image.network('https://image.flaticon.com/icons/png/512/2412/2412691.png');
        break;
      case WeatherCondition.mist:
      // image = Image.asset('assets/images/drizzle_small.png');
        image = Image.network('https://img2.pngio.com/cloud-dark-fog-icon-vector-stylish-weather-icons-softiconscom-foggy-weather-png-256_256.png');
        break;
      case WeatherCondition.clear:
      // image = Image.asset('assets/images/clear_small.png');
        image = Image.network('https://www.freeiconspng.com/thumbs/cloud-icon/cloud-icon-17.png');
        break;
      case WeatherCondition.fog:
      // image = Image.asset('assets/images/fog_small.png');
        image = Image.network('https://image.flaticon.com/icons/png/512/91/91990.png');
        break;
      case WeatherCondition.snow:
      // image = Image.asset('assets/images/snow_small.png');
        image = Image.network('https://www.iconninja.com/files/1017/818/543/ice-snow-cloud-weather-icon.svg');
        break;
      case WeatherCondition.rain:
      // image = Image.asset('assets/images/rain_small.png');
        image = Image.network('https://cdn.onlinewebfonts.com/svg/img_499748.png');
        break;
      case WeatherCondition.atmosphere:
      // image = Image.asset('assets/images/atmosphere_small.png');
        image = Image.network('https://cdn.onlinewebfonts.com/svg/img_542272.png');
        break;

      default:
      // image = Image.asset('assets/images/light_cloud_small.png');
        image = Image.network('https://lh3.googleusercontent.com/proxy/kobiNnjEemjQ7fP0t9iWWPrZkh0mAWHwuJrEtc5xW_7AGqtcIRdlLSD1OHbVvLla9mW1FP3RWmov3_ft9fcHUNDjmqK4g5o9dmCUvboKZnAikWOzHXnE6nLHoouSbrChzzmUFc5q0J-Qk1VHyxwZTNY');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}