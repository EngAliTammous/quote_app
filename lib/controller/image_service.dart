import 'dart:convert';
import 'package:http/http.dart'as http;
Future<String> fetchImageFromApi() async {
  String apiUrl = 'https://random.imagecdn.app/v1/image?category=buildings&format=json'; // Replace with your actual API URL

  // Make the HTTP request
  final http.Response response = await http.get(Uri.parse(apiUrl));

  // Check if the request was successful
  if (response.statusCode == 200) {

   dynamic mapApi = json.decode(response.body);

    //print(response.body);
    return mapApi['url'];
  } else {
    // If the request failed, throw an exception or return an empty list
    throw Exception('Failed to load image from API');
  }
}

Future<String> fetchContentFromApi() async {
  String apiUrl = 'https://api.quotable.io/random'; // Replace with your actual API URL

  // Make the HTTP request
  final http.Response response = await http.get(Uri.parse(apiUrl));

  // Check if the request was successful
  if (response.statusCode == 200) {

    dynamic mapApi = json.decode(response.body);

    //print(response.body);
    return mapApi['content'];
  } else {
    // If the request failed, throw an exception or return an empty list
    throw Exception('Failed to load image from API');
  }
}

void shareContent() {
   String contentToShare = "Check out this amazing content!"; // Replace with your content to share

  //Share.share(contentToShare);
}