class DriverModel{
  int id;
  String url;
  String name;

  DriverModel(this.id,this.url,this.name);

  DriverModel.fromJson(Map<String,dynamic>parsedJson){
    id=parsedJson['id'];
    url=parsedJson['url'];
    name=parsedJson['name'];
  }
}