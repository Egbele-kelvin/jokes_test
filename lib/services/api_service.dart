import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:joke_test/models/model.dart';
import 'package:joke_test/utils/constants.dart';

class JokesApi {
  var header = {'x-api-key': API_KEY};
  Future getJokes() async {
    http.Response response =
        await http.get(Uri.parse(baseUrl), headers: header);

    var responseData = jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);

    Jokes joke = Jokes(
      id: responseData['id'],
      type: responseData['type'],
      setUp: responseData['setup'],
      punchLine: responseData['punchline'],
    );
    return joke;
  }
}
