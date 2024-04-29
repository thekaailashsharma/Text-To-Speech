import 'dart:convert';
import 'dart:typed_data';

// import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:untitled/post.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/tts.dart';

class RemoteService {
  Future<Tts?> getPosts(String input) async {

    // var request = http.Request('POST', Uri.parse('https://dhruva-api.bhashini.gov.in/services/inference/pipeline'));
    // request.body = json.encode({
    //   "pipelineTasks": [
    //     {
    //       "taskType": "tts",
    //       "config": {
    //         "language": {
    //           "sourceLanguage": "en"
    //         },
    //         "serviceId": "ai4bharat/indic-tts-coqui-misc-gpu--t4",
    //         "gender": "female",
    //         "samplingRate": 8000
    //       }
    //     }
    //   ],
    //   "inputData": {
    //     "input": [
    //       {
    //         "source": "Hello"
    //       }
    //     ]
    //   }
    // });
    // request.headers.addAll(headers);
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   print("Hell Yeah");
    //   var bytes = await response.stream.bytesToString();
    //   var responses = await http.Response.fromStream(response);
    //   return ttsFromJson(responses.body);
    //
    // }
    // else {
    //   print("Hell Nah");
    //   print(response.reasonPhrase);
    // }
    // return null;
    var headers = {
      'Accept': ' */*',
      'User-Agent': ' Thunder Client (https://www.thunderclient.com)',
      'Authorization': '--B6MmdGD_BeC4QPDO2nNwcwvAc8BIhQrkhMAhi9dGcPKCPgqrE2LJkzJzcCAVNQ',
      'Content-Type': 'application/json'
    };
    var body = jsonEncode({
        "pipelineTasks": [
          {
            "taskType": "tts",
            "config": {
              "language": {
                "sourceLanguage": "en"
              },
              "serviceId": "ai4bharat/indic-tts-coqui-misc-gpu--t4",
              "gender": "female",
              "samplingRate": 8000
            }
          }
        ],
        "inputData": {
          "input": [
            {
              "source": input
            }
          ]
        }
      });

    var client = http.Client();
    var uri = Uri.parse("https://dhruva-api.bhashini.gov.in/services/inference/pipeline");

    var response = await client.post(uri, headers: headers, body: body);
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var json = response.body;
      print("Response body is ${response.body}");
      return ttsFromJson(json);
    }
    return null;
  }
}

