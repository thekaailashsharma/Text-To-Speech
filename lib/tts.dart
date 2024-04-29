// To parse this JSON data, do
//
//     final tts = ttsFromJson(jsonString);

import 'dart:convert';

Tts ttsFromJson(String str) => Tts.fromJson(json.decode(str));

String ttsToJson(Tts data) => json.encode(data.toJson());

class Tts {
  List<PipelineResponse> pipelineResponse;

  Tts({
    required this.pipelineResponse,
  });

  factory Tts.fromJson(Map<String, dynamic> json) => Tts(
    pipelineResponse: List<PipelineResponse>.from(json["pipelineResponse"].map((x) => PipelineResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pipelineResponse": List<dynamic>.from(pipelineResponse.map((x) => x.toJson())),
  };
}

class PipelineResponse {
  String taskType;
  Config config;
  dynamic output;
  List<Audio> audio;

  PipelineResponse({
    required this.taskType,
    required this.config,
    required this.output,
    required this.audio,
  });

  factory PipelineResponse.fromJson(Map<String, dynamic> json) => PipelineResponse(
    taskType: json["taskType"],
    config: Config.fromJson(json["config"]),
    output: json["output"],
    audio: List<Audio>.from(json["audio"].map((x) => Audio.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "taskType": taskType,
    "config": config.toJson(),
    "output": output,
    "audio": List<dynamic>.from(audio.map((x) => x.toJson())),
  };
}

class Audio {
  String audioContent;
  dynamic audioUri;

  Audio({
    required this.audioContent,
    required this.audioUri,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
    audioContent: json["audioContent"],
    audioUri: json["audioUri"],
  );

  Map<String, dynamic> toJson() => {
    "audioContent": audioContent,
    "audioUri": audioUri,
  };
}

class Config {
  String audioFormat;
  Language language;
  String encoding;
  int samplingRate;

  Config({
    required this.audioFormat,
    required this.language,
    required this.encoding,
    required this.samplingRate,
  });

  factory Config.fromJson(Map<String, dynamic> json) => Config(
    audioFormat: json["audioFormat"],
    language: Language.fromJson(json["language"]),
    encoding: json["encoding"],
    samplingRate: json["samplingRate"],
  );

  Map<String, dynamic> toJson() => {
    "audioFormat": audioFormat,
    "language": language.toJson(),
    "encoding": encoding,
    "samplingRate": samplingRate,
  };
}

class Language {
  String sourceLanguage;
  String sourceScriptCode;

  Language({
    required this.sourceLanguage,
    required this.sourceScriptCode,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    sourceLanguage: json["sourceLanguage"],
    sourceScriptCode: json["sourceScriptCode"],
  );

  Map<String, dynamic> toJson() => {
    "sourceLanguage": sourceLanguage,
    "sourceScriptCode": sourceScriptCode,
  };
}
