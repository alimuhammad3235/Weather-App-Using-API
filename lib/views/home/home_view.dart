import 'package:flutter/material.dart';
import 'package:weatherapp/controller/home_controller.dart';
import 'package:weatherapp/model/user_model.dart';
import 'package:weatherapp/utils/images.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

String a = _response!.weatherInfo.description;
String city1 = "";
List<Map> favourite = [
  // {"name": "karachi", "temp": 23}
];
TextEditingController _cityTextController = TextEditingController();
final _dataservices = DataServices();
WeatherResponse? _response;

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(children: [
            Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Image.asset(
                    "assets/images/night.gif",
                    fit: BoxFit.fitHeight,
                  )),
              if (_response?.weatherInfo.description == "scattered clouds")
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Image.asset(
                      "assets/images/night.gif",
                      fit: BoxFit.fitHeight,
                    )),
              if (_response?.weatherInfo.description == "haze")
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Image.asset(
                      "assets/images/day.gif",
                      fit: BoxFit.fitHeight,
                    )),
              if (_response?.weatherInfo.description == "smoke")
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Image.asset(
                      "assets/images/dayg.gif",
                      fit: BoxFit.fitHeight,
                    )),
              if (_response?.weatherInfo.description == "light rain" ||
                  _response?.weatherInfo.description == "moderate rain" ||
                  _response?.weatherInfo.description == "rain" ||
                  _response?.weatherInfo.description ==
                      "light intensity shower rain")
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Image.asset(
                      "assets/images/rain.gif",
                      fit: BoxFit.fitHeight,
                    )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Container(
                      width: 250,
                      child: TextFormField(
                        controller: _cityTextController,
                        onChanged: (value) {
                          city1 = value;
                          setState(() {
                            // checkweather(
                            //     "${snapshot.data[0].weather}", context);
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffE6E8EB)),
                          ),
                          hintText: 'Search Country',
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              final response = await _dataservices
                                  .getweather(_cityTextController.text);
                              setState(() {
                                _response = response;
                              });

                              _cityTextController.clear();
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                      favourite.add({
                        "name": _response?.cityName,
                        "temp": (_response!.tempInfo.temperature - 273)
                            .toStringAsFixed(0)
                      });
                      print(favourite);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
              if (_response != null)
                Center(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 140)),
                      Text(
                        "${_response?.cityName}",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ), //"${(snapshot.data[0].temp - 273).toStringAsFixed(0)}°"
                      Text(
                          "${(_response!.tempInfo.temperature - 273).toStringAsFixed(0)}°",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      if (_response?.weatherInfo.description == "haze")
                        Icon(
                          Icons.sunny,
                          color: Colors.orangeAccent,
                        ),
                      if (_response?.weatherInfo.description == "clear")
                        Image.asset("assets/images/night.dart"),
                      Text(
                        _response!.weatherInfo.description,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Humidity : ",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(_response!.humidityinfo.humidity.toString(),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pressure : ",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(_response!.pressureInfo.pressure.toString(),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Visibility : ",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(_response!.visibility.toString(),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Timezone : ",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(_response!.timezone.toString(),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 450, right: 20),
                child: Container(
                  width: 400,
                  height: 150,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: favourite.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.33,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  decoration: BoxDecoration(
                                      // color: Colors.black,
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {});
                                                  favourite.removeAt(index);
                                                  print(favourite);
                                                },
                                                child: Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.white,
                                                  size: 25,
                                                ))),
                                        Center(
                                            child: Text(
                                          favourite[index]["name"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                        )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        Text(
                                          "${favourite[index]["temp"]}°"
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                        ),
                                      ],
                                    ),
                                  ))),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ]),
          ]),
        ],
      ),
    );
  }
}
