class ApiResponse {
  final Location location;
  final Current current;

  ApiResponse({required this.location, required this.current});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'current': current.toJson(),
    };
  }
}

class Location {
  final String name;
  final String country;

  Location({required this.name, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
    };
  }
}

class Current {
  final double tempC;
  final double windSpeed;
  final int humidity;
  final double uvIndex;
  final double feelslikeC;
  final int cloud;

  Current({
    required this.tempC,
    required this.windSpeed,
    required this.humidity,
    required this.uvIndex,
    required this.feelslikeC,
    required this.cloud,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: json['temp_c'],
      windSpeed: json['wind_kph'],
      humidity: json['humidity'],
      uvIndex: json['uv'],
      feelslikeC: json['feelslike_c'],
      cloud: json['cloud'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp_c': tempC,
      'wind_kph': windSpeed,
      'humidity': humidity,
      'uv': uvIndex,
      'feelslike_c': feelslikeC,
      'cloud': cloud,
    };
  }
}


// class ApiResponse {
//   Location? location;
//   Current? current;

//   ApiResponse({this.location, this.current});

//   ApiResponse.fromJson(Map<String, dynamic> json) {
//     location =
//         json['location'] != null ? Location.fromJson(json['location']) : null;
//     current =
//         json['current'] != null ? Current.fromJson(json['current']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     if (current != null) {
//       data['current'] = current!.toJson();
//     }
//     return data;
//   }
// }

// class Location {
//   String? name;
//   String? country;
//   String? localtime;

//   Location({this.name, this.country, this.localtime});

//   Location.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     country = json['country'];
//     localtime = json['localtime'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['country'] = country;
//     data['localtime'] = localtime;
//     return data;
//   }
// }

// class Current {
//   double? tempC;
//   double? tempF;
//   int? isDay;
//   Condition? condition;
//   double? windKph;
//   String? windDir;
//   double? precipMm;
//   int? humidity;
//   double? feelslikeC;
//   int? uv;

//   Current(
//       {this.tempC,
//       this.tempF,
//       this.isDay,
//       this.condition,
//       this.windKph,
//       this.windDir,
//       this.precipMm,
//       this.humidity,
//       this.feelslikeC,
//       this.uv});

//   Current.fromJson(Map<String, dynamic> json) {
//     tempC = json['temp_c'];
//     tempF = json['temp_f'];
//     isDay = json['is_day'];
//     condition = json['condition'] != null
//         ? Condition.fromJson(json['condition'])
//         : null;
//     windKph = json['wind_kph'];
//     windDir = json['wind_dir'];
//     precipMm = json['precip_mm'];
//     humidity = json['humidity'];
//     feelslikeC = json['feelslike_c'];
//     uv = json['uv'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['temp_c'] = tempC;
//     data['temp_f'] = tempF;
//     data['is_day'] = isDay;
//     if (condition != null) {
//       data['condition'] = condition!.toJson();
//     }
//     data['wind_kph'] = windKph;
//     data['wind_dir'] = windDir;
//     data['precip_mm'] = precipMm;
//     data['humidity'] = humidity;
//     data['feelslike_c'] = feelslikeC;
//     data['uv'] = uv;
//     return data;
//   }
// }

// class Condition {
//   String? text;
//   String? icon;
//   int? code;

//   Condition({this.text, this.icon, this.code});

//   Condition.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     icon = json['icon'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['text'] = text;
//     data['icon'] = icon;
//     data['code'] = code;
//     return data;
//   }
// }
/*
class ApiResponse {
  final Location location;
  final Current current;

  ApiResponse({required this.location, required this.current});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'current': current.toJson(),
    };
  }
}

class Location {
  final String name;
  final String country;

  Location({required this.name, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
    };
  }
}

class Current {
  final double tempC;

  Current({required this.tempC});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: json['temp_c'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp_c': tempC,
    };
  }
}
*/
// class ApiResponse {
//   final Location location;
//   final Current current;

//   ApiResponse({required this.location, required this.current});

//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     return ApiResponse(
//       location: Location.fromJson(json['location']),
//       current: Current.fromJson(json['current']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'location': location.toJson(),
//       'current': current.toJson(),
//     };
//   }
// }

// class Location {
//   final String name;
//   final String country;

//   Location({required this.name, required this.country});

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       name: json['name'],
//       country: json['country'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'country': country,
//     };
//   }
// }

// class Current {
//   final double tempC;
//   final double windSpeed; // Wind speed in kph or mph
//   final int humidity; // Humidity percentage
//   final double uvIndex; // UV index
//   final double feelslikeC; // Feels like temperature in Celsius

//   Current({
//     required this.tempC,
//     required this.windSpeed,
//     required this.humidity,
//     required this.uvIndex,
//     required this.feelslikeC,

//   });

//   factory Current.fromJson(Map<String, dynamic> json) {
//     return Current(
//       tempC: json['temp_c'],
//       windSpeed: json['wind_kph'], // Adjust according to the API response
//       humidity: json['humidity'],
//       uvIndex: json['uv'],
//       feelslikeC: json['feelslike_c'],

//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'temp_c': tempC,
//       'wind_kph': windSpeed, // Adjust according to the API response
//       'humidity': humidity,
//       'uv': uvIndex,
//       'feelslike_c': feelslikeC,

//     };
//   }
// }