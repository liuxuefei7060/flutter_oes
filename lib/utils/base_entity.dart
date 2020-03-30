import '../entity_factory.dart';

class BaseEntity<T> {
  String message;
  int status;
  T result;

  BaseEntity({this.message, this.status, this.result});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      status: json["status"],
      message: json["message"],
      // data值需要经过工厂转换为我们传进来的类型
      result: EntityFactory.generateOBJ<T>(json["result"]),
    );
  }

}

class BaseListEntity<T> {
  String message;
  int status;
  List<T> resultList;

  BaseListEntity({this.message, this.status, this.resultList});

  factory BaseListEntity.fromJson(json) {
    List<T> dataList = new List<T>();
    if (json['result'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['result'] as List).forEach((v) {
        dataList.add(EntityFactory.generateOBJ<T>(v));
      });
    }
    return BaseListEntity(
      status: json["status"],
      message: json["message"],
      resultList: dataList,
    );
  }
}

