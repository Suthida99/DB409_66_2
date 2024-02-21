import 'package:http/http.dart' as http;

class Weather {
//eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjczOGUzMzc1OTJmNjEwN2Y5ODhiYjg2MWRhYjczMWIzZjQ2M2FlOGYwNGM0ZTM2MDkxYzU1ZmUwOWFiY2EwOTZiODM0OWE4YzE4ZjYxNWZjIn0.eyJhdWQiOiIyIiwianRpIjoiNzM4ZTMzNzU5MmY2MTA3Zjk4OGJiODYxZGFiNzMxYjNmNDYzYWU4ZjA0YzRlMzYwOTFjNTVmZTA5YWJjYTA5NmI4MzQ5YThjMThmNjE1ZmMiLCJpYXQiOjE3MDc4ODIyNjMsIm5iZiI6MTcwNzg4MjI2MywiZXhwIjoxNzM5NTA0NjYzLCJzdWIiOiIzMDA1Iiwic2NvcGVzIjpbXX0.V4o-9upu4_aQgHdCAn2_WaSSLzpif0ani8lrtrKVYWYyvzDUwI9YmELC7aKf3MSp_XZuI2obsWOJ_CvwvH8dnRnG13IsvfTQlMRYFWRFWynXrRVMzu1GgVn4ur2lozVfwK47AxWR8t6X77h6BBfrNPXDrdv4rqhhiOeSrCRnZn5X_qXf6XPqSXcAaex6ssEdpcNFdIST9KhHjS893wj78-fn0SxhHG8jkh85iCXgeKNaRJBW7aqyeGTz8xLV5Mmd2QxIc2osB_TiEuzeiYy4e4o8-q7OOGXG0hzLGYC18PGVS27DsLomp1AbWLWjm4gIZjphnTqiVk7G3Hso5QWAdZ6zli5qSvlOa1HzmPh9wvjVCa2BYQJ_JrZlIjNNTQTHciiE3LRb064cRYAs5_GaXd4w7JFwk5Q1NCancf8y_BOPvaurSBepJTOfBfaG1SGBvBkRoFOEr2FAdbCDC1q4mC5bi4HP7V1RR1FUjBlPNK8wye_zBzpt6diN1WdGvSpg__on-GWjpboUfFQ2uJtU9E6CRKwD7ljY-3qg9mNggnGwcrqIikADVQoQvAgZo1gln0SDqsE7bw0t6Lav-iOusuxENufEqX-vbLeJcN1xleGmwq0HhTHGfP-ROHyOdKmC-KGIIu2Bw2L9GcyLMWiv-YlbcL4wba83miaM69wQUMM
  static const _condition = [
    '',
    'ท้องฟ้าแจ่มใส (Clear)',
    'มีเมฆบางส่วน (Partly cloudy)',
    'เมฆเป็นส่วนมาก (Cloudy)',
    'มีเมฆมาก (Overcast)',
    'ฝนตกเล็กน้อย (Light rain)',
    'ฝนปานกลาง (Moderate rain)',
    'ฝนตกหนัก (Heavy rain)',
    'ฝนฟ้าคะนอง (Thunderstorm)',
    'อากาศหนาวจัด (Very cold)',
    'อากาศหนาว (Cold)',
    'อากาศเย็น (Cool)',
    'อากาศร้อนจัด (Very hot)',
  ];
  static const _symbol = [
    '',
    '🌈',
    '☁',
    '☁☁',
    '☁☁☁',
    '🌦',
    '🌧',
    '☔',
    '⛈',
    '☃',
    '⛄',
    '❄',
    '☀',
  ];
  final String address;
  final double temperature;
  final int cond;

  Weather(
      {required this.address, required this.temperature, required this.cond});
  String get condition => _condition[cond];
  String get symbol => _symbol[cond];
}
