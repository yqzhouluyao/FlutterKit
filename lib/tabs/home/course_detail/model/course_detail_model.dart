import 'package:json_annotation/json_annotation.dart'; 
  
part 'course_detail_model.g.dart';


@JsonSerializable()
  class CourseDetailModel extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  CourseDetailModel(this.code,this.message,this.data,);

  factory CourseDetailModel.fromJson(Map<String, dynamic> srcJson) => _$CourseDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseDetailModelToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'class_id')
  int classId;

  @JsonKey(name: 'begin_at')
  int beginAt;

  @JsonKey(name: 'end_at')
  int endAt;

  @JsonKey(name: 'cycle')
  String cycle;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'teacher')
  String teacher;

  @JsonKey(name: 'sub_type')
  int subType;

  @JsonKey(name: 'time_cycle')
  String timeCycle;

  @JsonKey(name: 'subject_type')
  String subjectType;

  @JsonKey(name: 'subs_info')
  List<Subs_info> subsInfo;

  @JsonKey(name: 'quota')
  int quota;

  @JsonKey(name: 'ordered')
  int ordered;

  @JsonKey(name: 'goods_id')
  String goodsId;

  @JsonKey(name: 'goods_type')
  int goodsType;

  @JsonKey(name: 'season')
  String season;

  @JsonKey(name: 'grade')
  String grade;

  @JsonKey(name: 'user_state')
  int userState;

  @JsonKey(name: 'order_state')
  int orderState;

  @JsonKey(name: 'desp')
  String desp;

  @JsonKey(name: 'order_begin_at')
  int orderBeginAt;

  @JsonKey(name: 'order_dead_line_at')
  int orderDeadLineAt;

  @JsonKey(name: 'online')
  int online;

  @JsonKey(name: 'real_price')
  int realPrice;

  @JsonKey(name: 'pre_days')
  int preDays;

  @JsonKey(name: 'module')
  String module;

  @JsonKey(name: 'order_no')
  String orderNo;

  @JsonKey(name: 'activity_type')
  int activityType;

  @JsonKey(name: 'difficult')
  int difficult;

  @JsonKey(name: 'course_belong')
  String courseBelong;

  @JsonKey(name: 'teachers_info')
  List<Teachers_info> teachersInfo;

  @JsonKey(name: 'cart_exist')
  bool cartExist;

  @JsonKey(name: 'material_goods_id')
  int materialGoodsId;

  @JsonKey(name: 'material_goods_price')
  int materialGoodsPrice;

  @JsonKey(name: 'union_ids')
  List<dynamic> unionIds;

  @JsonKey(name: 'content_type')
  int contentType;

  @JsonKey(name: 'is_visible')
  int isVisible;

  Data(this.classId,this.beginAt,this.endAt,this.cycle,this.title,this.price,this.city,this.teacher,this.subType,this.timeCycle,this.subjectType,this.subsInfo,this.quota,this.ordered,this.goodsId,this.goodsType,this.season,this.grade,this.userState,this.orderState,this.desp,this.orderBeginAt,this.orderDeadLineAt,this.online,this.realPrice,this.preDays,this.module,this.orderNo,this.activityType,this.difficult,this.courseBelong,this.teachersInfo,this.cartExist,this.materialGoodsId,this.materialGoodsPrice,this.unionIds,this.contentType,this.isVisible,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Subs_info extends Object {

  @JsonKey(name: 'subclass_id')
  int subclassId;

  @JsonKey(name: 'begin_at')
  int beginAt;

  @JsonKey(name: 'end_at')
  int endAt;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'teacher_id')
  int teacherId;

  @JsonKey(name: 'teacher_name')
  String teacherName;

  @JsonKey(name: 'sub_index')
  int subIndex;

  @JsonKey(name: 'original_price')
  int originalPrice;

  Subs_info(this.subclassId,this.beginAt,this.endAt,this.price,this.teacherId,this.teacherName,this.subIndex,this.originalPrice,);

  factory Subs_info.fromJson(Map<String, dynamic> srcJson) => _$Subs_infoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Subs_infoToJson(this);

}

  
@JsonSerializable()
  class Teachers_info extends Object {

  @JsonKey(name: 'formal_intro')
  String formalIntro;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'interest_intro')
  String interestIntro;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'picture')
  String picture;

  @JsonKey(name: 'teacher_name')
  String teacherName;

  @JsonKey(name: 'unique_name')
  String uniqueName;

  Teachers_info(this.formalIntro,this.gender,this.id,this.interestIntro,this.level,this.picture,this.teacherName,this.uniqueName,);

  factory Teachers_info.fromJson(Map<String, dynamic> srcJson) => _$Teachers_infoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Teachers_infoToJson(this);

}

  
