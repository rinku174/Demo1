import 'dart:convert';

import 'package:http/http.dart' as http;

Map<dynamic, dynamic> mapResponse = {0: 0};
Map<dynamic, dynamic> dataResponse = {0: 0};

Future apicall() async {
  http.Response response;
  response = await http.get(Uri.parse(" https://reqres.in/api/users"));
  if (response.statusCode == 200) {
    mapResponse = json.decode(response.body);
    dataResponse = mapResponse['data'];
  } else {
    throw Exception('Failed to load ');
  }
}

@override
void initState() {
  initState();
  apicall();
}
