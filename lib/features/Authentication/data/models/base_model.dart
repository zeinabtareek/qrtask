

abstract class BaseResModel<T> {
  String? msg;
  int? status;


  
  BaseResModel({
    this.msg,
    this.status,
  });
  T? get data;
  int get statusNumber;

  
}

class MsgModel extends BaseResModel<MsgModel> {


  Map<String,dynamic>? stateData;
  MsgModel({

    this.stateData,
  });



  MsgModel.fromKMap(Map<String, dynamic> map) {
    msg = map['message'];
    status = map['status']?.toInt();
    stateData = map['data'];
  }

  // String toJson() => json.encode(toMap());

  factory MsgModel.fromJson(Map<String, dynamic> map) => MsgModel.fromKMap(map);

  bool get isSuccess => status == 200;
  @override
  MsgModel? get data => this;

  @override
  int get statusNumber => status!;

  @override
  String toString() {

    return "MSG( msg $msg  status $status)";
  }
}
