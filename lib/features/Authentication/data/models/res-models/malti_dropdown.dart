 import '../base_id_value_model.dart';
import '../base_model.dart';

// malti_dropdown
class MaltiDropdown extends BaseResModel<List<BaseIdNameModelString>> {
  List<BaseIdNameModelString>? _data;
  MaltiDropdown(
    this._data, {
    super.msg,
    super.status,
  });

  @override
  List<BaseIdNameModelString>? get data => _data;

  @override
  int get statusNumber =>status!;

  factory MaltiDropdown.fromJson(Map<String, dynamic> map) {
    return MaltiDropdown(
      map['data'] != null ? List<BaseIdNameModelString>.from(map['data']?.map((x) => BaseIdNameModelString.fromMap(x))) : null,
      msg: map['message'],
      status: map['status'],
    );
  }


}
