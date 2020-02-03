import 'package:http/http.dart' as http;

class LoremApi {

  static Future<String> getLorem() async {

    var url = "https://loripsum.net/api";
    print("GET > $url");

    var response = await http.get(url);

    String text = response.body;
    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");

    return text;
  }
}
