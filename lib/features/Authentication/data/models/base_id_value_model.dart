 abstract class BaseIdValueModel<T> {
  String?  id;
  String?  createdAt;
  T?  value;
  BaseIdValueModel(
    this.id,
    this.value,
    this.createdAt,

  );
}

 class BaseIdNameModelString extends BaseIdValueModel<String> {
   BaseIdNameModelString(
       String? id,
       String? value,
       String? createdAt,
       ) : super(id, value, createdAt);

   factory BaseIdNameModelString.fromMap(Map<String, dynamic> map) {
     return BaseIdNameModelString(
       map['id'].toString(),
       map['name'].toString(),
       map['created_at'].toString(),
     );
   }

   Map<String, dynamic> toMap() {
     return {
       "id": id,
       "name": value,
       "created_at": createdAt,
     };
   }

   Map<String, dynamic> toJson() {
     return toMap();
   }

   factory BaseIdNameModelString.defaultItem() {
     return BaseIdNameModelString(
       "null",
       "1",
       "1",
     );
   }

   factory BaseIdNameModelString.defaultItemFrom(int index) {
     return BaseIdNameModelString(
       "null",
       "$index",
       "",
     );
   }

   @override
   String toString() => value ?? '';

   @override
   bool operator ==(Object other) {
     if (identical(this, other)) return true;

     return other is BaseIdNameModelString &&
         other.id == id &&
         other.value == value;
   }

   @override
   int get hashCode => id.hashCode ^ value.hashCode;
 }
