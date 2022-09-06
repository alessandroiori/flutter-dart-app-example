class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  //Constructor
  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);

  //Constructor: create an instance of Weather with the weatherMap uset as parameter
  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    //this.temperature = (weatherMap['main']['temp'] * (9/5) - 459.67) ?? 0; //converted in faranheit, if null return 0
    temperature = (weatherMap['main']['temp'] - 273.15) ?? 0; //converted in celsius, if null return 0
    perceived = (weatherMap['main']['feels_like'] - 273.15) ?? 0; //converted in celsius, if null return 0
    pressure = weatherMap['main']['pressure'] ?? 0;
    humidity = weatherMap['main']['humidity'] ?? 0;
    description = weatherMap['weather'][0]['main'] ?? 0;
  }
}
