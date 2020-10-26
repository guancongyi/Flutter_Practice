import 'dart:convert';

class Article {
  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String inc;
  final String count;
  final String hot;

  Article({
    this.logo,
    this.name,
    this.location,
    this.type,
    this.size,
    this.employee,
    this.hot,
    this.count,
    this.inc,
  });

  static resolveDataFromJsonString(String js) {
    List<Article> listModel = new List<Article>();
    List list = jsonDecode(js)['list'];
    list.forEach((element) {
      var model = new Article(
        logo: element['logo'],
        name: element['name'],
        location: element['location'],
        type: element['type'],
        size: element['size'],
        employee: element['employee'],
        hot: element['hot'],
        count: element['count'],
        inc: element['inc'],
      );
      listModel.add(model);
    });
    return listModel;
  }
}
