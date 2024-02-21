import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjczOGUzMzc1OTJmNjEwN2Y5ODhiYjg2MWRhYjczMWIzZjQ2M2FlOGYwNGM0ZTM2MDkxYzU1ZmUwOWFiY2EwOTZiODM0OWE4YzE4ZjYxNWZjIn0.eyJhdWQiOiIyIiwianRpIjoiNzM4ZTMzNzU5MmY2MTA3Zjk4OGJiODYxZGFiNzMxYjNmNDYzYWU4ZjA0YzRlMzYwOTFjNTVmZTA5YWJjYTA5NmI4MzQ5YThjMThmNjE1ZmMiLCJpYXQiOjE3MDc4ODIyNjMsIm5iZiI6MTcwNzg4MjI2MywiZXhwIjoxNzM5NTA0NjYzLCJzdWIiOiIzMDA1Iiwic2NvcGVzIjpbXX0.V4o-9upu4_aQgHdCAn2_WaSSLzpif0ani8lrtrKVYWYyvzDUwI9YmELC7aKf3MSp_XZuI2obsWOJ_CvwvH8dnRnG13IsvfTQlMRYFWRFWynXrRVMzu1GgVn4ur2lozVfwK47AxWR8t6X77h6BBfrNPXDrdv4rqhhiOeSrCRnZn5X_qXf6XPqSXcAaex6ssEdpcNFdIST9KhHjS893wj78-fn0SxhHG8jkh85iCXgeKNaRJBW7aqyeGTz8xLV5Mmd2QxIc2osB_TiEuzeiYy4e4o8-q7OOGXG0hzLGYC18PGVS27DsLomp1AbWLWjm4gIZjphnTqiVk7G3Hso5QWAdZ6zli5qSvlOa1HzmPh9wvjVCa2BYQJ_JrZlIjNNTQTHciiE3LRb064cRYAs5_GaXd4w7JFwk5Q1NCancf8y_BOPvaurSBepJTOfBfaG1SGBvBkRoFOEr2FAdbCDC1q4mC5bi4HP7V1RR1FUjBlPNK8wye_zBzpt6diN1WdGvSpg__on-GWjpboUfFQ2uJtU9E6CRKwD7ljY-3qg9mNggnGwcrqIikADVQoQvAgZo1gln0SDqsE7bw0t6Lav-iOusuxENufEqX-vbLeJcN1xleGmwq0HhTHGfP-ROHyOdKmC-KGIIu2Bw2L9GcyLMWiv-YlbcL4wba83miaM69wQUMM';
  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["WeatherForecasts"][0]["forecasts"]
          [0]["data"];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
        address: '${address.subLocality}\n${address.administrativeArea}',
        temperature: result['tc'],
        cond: result['cond'],
      );
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
