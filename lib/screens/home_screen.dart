import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/widgets/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiResponse? response;
  bool inProgress = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/wbg1.jpg"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.srcATop),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              _buildSearchWidget(),
              SizedBox(
                height: 15.h,
              ),
              if (inProgress)
                const CircularProgressIndicator()
              else
                _buildWeatherWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return TextField(
      cursorColor: const Color.fromARGB(220, 255, 255, 255),
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search any location",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0).r,
          borderSide: const BorderSide(
            width: 3,
            color: Colors.blue, // Default border color
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0).r,
          borderSide: const BorderSide(
            width: 1.5,
            color: Color.fromARGB(255, 1, 106, 95), // Border color when focused
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0).r,
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xFF980340), // Border color when enabled (not focused)
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            _getWeatherData(_controller.text);
          },
        ),
      ),
      onSubmitted: (value) {
        _getWeatherData(value);
      },
    );
  }

  Widget _buildWeatherWidget() {
    if (response == null) {
      return const Text("Search for the location to get weather data");
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildWeatherInfoRow(
            icon: Icons.location_on,
            label: "${response?.location.name}, ${response?.location.country}",
          ),
          _buildWeatherInfoRow(
            label: "Temperature: ${response?.current.tempC}°C",
          ),
          _buildWeatherInfoRow(
            label: "Feels like: ${response?.current.feelslikeC}°C",
          ),
          _buildWeatherInfoRow(
            label: "Wind Speed: ${response?.current.windSpeed} kph",
          ),
          _buildWeatherInfoRow(
            label: "Humidity: ${response?.current.humidity}%",
          ),
          _buildWeatherInfoRow(
            label: "UV Index: ${response?.current.uvIndex}",
          ),
          _buildWeatherInfoRow(
            label: "Cloud Cover: ${response?.current.cloud}%",
          ),
        ],
      );
    }
  }

  Widget _buildWeatherInfoRow({IconData? icon, required String label}) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 45.h,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        backgroundBlendMode: BlendMode.difference,
        borderRadius: BorderRadius.circular(30.0).r,
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 71, 131, 161),
            Color(0xFF980340),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(icon, color: const Color(0xFFC60240), size: 25.sp),
          if (icon != null) SizedBox(width: 7.w),
          Text(
            label,
            style: TextStyle(
              color: const Color.fromARGB(255, 217, 216, 216),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _getWeatherData(String location) async {
    setState(() {
      inProgress = true;
    });

    try {
      response = await WeatherApi().getCurrentWeather(location);
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:weather/Model/weathermodel.dart';
// import 'package:weather/Widgets/api.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ApiResponse? response;
//   bool inProgress = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         height: size.height,
//         width: size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: const AssetImage("assets/wbg.jpg"),
//             colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.15), BlendMode.dstATop),
//             fit: BoxFit.fill,
//             alignment: Alignment.center,
//           ),
//         ),
//         padding: EdgeInsets.all(10.w),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 40.h,
//             ),
//             _buildSearchWidget(),
//             SizedBox(
//               height: 15.h,
//             ),
//             if (inProgress)
//               const CircularProgressIndicator()
//             else
//               _buildWeatherWidget(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchWidget() {
//     return SearchBar(
//       hintText: "Search any location",
//       onSubmitted: (value) {
//         _getWeatherData(value);
//       },
//     );
//   }

//   Widget _buildWeatherWidget() {
//     final sz = MediaQuery.of(context).size;
//     if (response == null) {
//       return const Text("Search for the location to get weather data");
//     } else {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 45.h,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               backgroundBlendMode: BlendMode.difference,
//               borderRadius: BorderRadius.circular(30.0).r,
//               gradient: const LinearGradient(
//                 colors: [
//                   //Colors.black,
//                   Color.fromARGB(255, 71, 131, 161),
//                   Color(0xFF980340),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   color: const Color(0xFFC60240),
//                   //color: Color(0xFF980340),
//                   // color: Colors.red,
//                   Icons.location_on,
//                   size: 25.sp,
//                 ),
//                 SizedBox(
//                   width: 7.w,
//                 ),
//                 Text(
//                   response?.location.name ?? "",
//                   style: TextStyle(
//                     color: const Color.fromARGB(255, 232, 229, 229),
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 Text(
//                   response?.location.country ?? "",
//                   style: TextStyle(
//                     color: const Color.fromARGB(255, 232, 229, 229),
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Container(
//             height: 45.h,
//             width: sz.width,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               backgroundBlendMode: BlendMode.difference,
//               borderRadius: BorderRadius.circular(30.0).r,
//               gradient: const LinearGradient(
//                 colors: [
//                   //Colors.black,
//                   Color.fromARGB(255, 71, 131, 161),
//                   Color(0xFF980340),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Temperature:   ${response?.current.tempC}°C",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Container(
//             height: 45.h,
//             width: sz.width,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               backgroundBlendMode: BlendMode.difference,
//               borderRadius: BorderRadius.circular(30.0).r,
//               gradient: const LinearGradient(
//                 colors: [
//                   //Colors.black,
//                   Color.fromARGB(255, 71, 131, 161),
//                   Color(0xFF980340),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Feels like: ${response?.current.feelslikeC}°C",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Container(
//             height: 45.h,
//             width: sz.width,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               backgroundBlendMode: BlendMode.difference,
//               borderRadius: BorderRadius.circular(30.0).r,
//               gradient: const LinearGradient(
//                 colors: [
//                   //Colors.black,
//                   Color.fromARGB(255, 71, 131, 161),
//                   Color(0xFF980340),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Wind Speed: ${response?.current.windSpeed} kph",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Container(
//             height: 45.h,
//             width: sz.width,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               backgroundBlendMode: BlendMode.difference,
//               borderRadius: BorderRadius.circular(30.0).r,
//               gradient: const LinearGradient(
//                 colors: [
//                   //Colors.black,
//                   Color.fromARGB(255, 71, 131, 161),
//                   Color(0xFF980340),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Humidity: ${response?.current.humidity}%",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Container(
//             height: 45.h,
//             width: sz.width,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               backgroundBlendMode: BlendMode.difference,
//               borderRadius: BorderRadius.circular(30.0).r,
//               gradient: const LinearGradient(
//                 colors: [
//                   //Colors.black,
//                   Color.fromARGB(255, 71, 131, 161),
//                   Color(0xFF980340),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "UV Index: ${response?.current.uvIndex}",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Container(
//             height: 45.h,
//             width: sz.width,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               backgroundBlendMode: BlendMode.difference,
//               borderRadius: BorderRadius.circular(30.0).r,
//               gradient: const LinearGradient(
//                 colors: [
//                   //Colors.black,
//                   Color.fromARGB(255, 71, 131, 161),
//                   Color(0xFF980340),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Cloud Cover: ${response?.current.cloud}%",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//   }

//   _getWeatherData(String location) async {
//     setState(() {
//       inProgress = true;
//     });

//     try {
//       response = await WeatherApi().getCurrentWeather(location);
//     } catch (e) {
//     } finally {
//       setState(() {
//         inProgress = false;
//       });
//     }
//     //ApiResponse response = await WeatherApi().getCurrentWeather(location);
//   }
//   // _getWeatherData(String location) async {
//   //   ApiResponse response = await WeatherApi().getCurrentWeather(location);
//   //   print(response.toJson());
//   // }
// }

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Model/weathermodel.dart';
import 'package:weather/Widgets/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiResponse? response;
  bool inProgress = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/wbg.jpg"),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.15), BlendMode.dstATop),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            _buildSearchWidget(),
            SizedBox(
              height: 15.h,
            ),
            if (inProgress)
              const CircularProgressIndicator()
            else
              _buildWeatherWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return TextField(
      cursorColor: const Color.fromARGB(220, 255, 255, 255),
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search any location",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0).r,
          borderSide: const BorderSide(
            width: 3,
            color: Colors.blue, // Default border color
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0).r,
          borderSide: const BorderSide(
            width: 1.5,
            color: Color.fromARGB(255, 1, 106, 95), // Border color when focused
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0).r,
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xFF980340), // Border color when enabled (not focused)
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            _getWeatherData(_controller.text);
          },
        ),
      ),
      onSubmitted: (value) {
        _getWeatherData(value);
      },
    );
  }

  // Widget _buildSearchWidget() {
  //   return TextField(
  //     cursorColor: Colors.teal,
  //     style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
  //     controller: _controller,
  //     decoration: InputDecoration(
  //       hintText: "Search any location",
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(25.0).r,
  //         borderSide: const BorderSide(
  //           width: 3,
  //           color: Colors.blue,
  //         ),
  //       ),
  //       suffixIcon: IconButton(
  //         icon: const Icon(Icons.search),
  //         onPressed: () {
  //           _getWeatherData(_controller.text);
  //         },
  //       ),
  //     ),
  //     onSubmitted: (value) {
  //       _getWeatherData(value);
  //     },
  //   );
  // }

  Widget _buildWeatherWidget() {
    if (response == null) {
      return const Text("Search for the location to get weather data");
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildWeatherInfoRow(
            icon: Icons.location_on,
            label: "${response?.location.name}, ${response?.location.country}",
          ),
          _buildWeatherInfoRow(
            label: "Temperature: ${response?.current.tempC}°C",
          ),
          _buildWeatherInfoRow(
            label: "Feels like: ${response?.current.feelslikeC}°C",
          ),
          _buildWeatherInfoRow(
            label: "Wind Speed: ${response?.current.windSpeed} kph",
          ),
          _buildWeatherInfoRow(
            label: "Humidity: ${response?.current.humidity}%",
          ),
          _buildWeatherInfoRow(
            label: "UV Index: ${response?.current.uvIndex}",
          ),
          _buildWeatherInfoRow(
            label: "Cloud Cover: ${response?.current.cloud}%",
          ),
        ],
      );
    }
  }

  Widget _buildWeatherInfoRow({IconData? icon, required String label}) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 45.h,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        backgroundBlendMode: BlendMode.difference,
        borderRadius: BorderRadius.circular(30.0).r,
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 71, 131, 161),
            Color(0xFF980340),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(icon, color: const Color(0xFFC60240), size: 25.sp),
          if (icon != null) SizedBox(width: 7.w),
          Text(
            label,
            style: TextStyle(
              color: const Color.fromARGB(255, 217, 216, 216),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _getWeatherData(String location) async {
    setState(() {
      inProgress = true;
    });

    try {
      response = await WeatherApi().getCurrentWeather(location);
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}
*/