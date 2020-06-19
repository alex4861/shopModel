
class HomeDepartmentsModel{
  String id;
  String name;
  int v;

  HomeDepartmentsModel({this.id,this.name,  this.v});
  factory HomeDepartmentsModel.fromJson(Map<String, dynamic> json) {
    return HomeDepartmentsModel(id: json['_id'], name: json['Name'], v: json['__v'] );
  }

}

class Departments{
  List<HomeDepartmentsModel> dataReturn;
  Departments({this.dataReturn});

    factory Departments.fromJson(List<dynamic> parsedJson) {

      List<HomeDepartmentsModel> homeDepartmentsModel = new List<HomeDepartmentsModel>();
      homeDepartmentsModel = parsedJson.map((i)=>HomeDepartmentsModel.fromJson(i)).toList();

      return new Departments(
        dataReturn: homeDepartmentsModel,
      );
    }


}


class ProductsData{
  final String id;
  final int v;

  final String name;
  final double price;
  final String image;
  final String sku;
  final String description;
  final String details;
  final String department;

  ProductsData({this.id, this.v,this.name, this.price, this.image, this.sku, this.description, this.details, this.department});

  factory ProductsData.fromJson(Map<String, dynamic> parsedJson) {
    return ProductsData(
      id: parsedJson['_id'],
      v: parsedJson['__v'],
      name: parsedJson['Name'],
      price: parsedJson['Price'],
      image: parsedJson['Image'],
      sku: parsedJson['SKU'],
      description: parsedJson['Description'],
      details: parsedJson['Details'],
      department: parsedJson['Departament'],

    );
  }

}
class Products{
  List<ProductsData> dataReturn;
  Products({this.dataReturn});

  factory Products.fromJson(Map<String, dynamic>  parsedJson) {

    var list = parsedJson['Data'] as List;
    List<ProductsData> imagesList = list.map((i) => ProductsData.fromJson(i)).toList();

    return Products(
      dataReturn: imagesList,
    );

  }

}
