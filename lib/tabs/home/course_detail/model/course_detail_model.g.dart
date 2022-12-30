// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailModel _$CourseDetailModelFromJson(Map<String, dynamic> json) =>
    CourseDetailModel(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseDetailModelToJson(CourseDetailModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['class_id'] as int,
      json['begin_at'] as int,
      json['end_at'] as int,
      json['cycle'] as String,
      json['title'] as String,
      json['price'] as int,
      json['city'] as String,
      json['teacher'] as String,
      json['sub_type'] as int,
      json['time_cycle'] as String,
      json['subject_type'] as String,
      (json['subs_info'] as List<dynamic>)
          .map((e) => Subs_info.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['quota'] as int,
      json['ordered'] as int,
      json['goods_id'] as String,
      json['goods_type'] as int,
      json['season'] as String,
      json['grade'] as String,
      json['user_state'] as int,
      json['order_state'] as int,
      json['desp'] as String,
      json['order_begin_at'] as int,
      json['order_dead_line_at'] as int,
      json['online'] as int,
      json['real_price'] as int,
      json['pre_days'] as int,
      json['module'] as String,
      json['order_no'] as String,
      json['activity_type'] as int,
      json['difficult'] as int,
      json['course_belong'] as String,
      (json['teachers_info'] as List<dynamic>)
          .map((e) => Teachers_info.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['cart_exist'] as bool,
      json['material_goods_id'] as int,
      json['material_goods_price'] as int,
      json['union_ids'] as List<dynamic>,
      json['content_type'] as int,
      json['is_visible'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'class_id': instance.classId,
      'begin_at': instance.beginAt,
      'end_at': instance.endAt,
      'cycle': instance.cycle,
      'title': instance.title,
      'price': instance.price,
      'city': instance.city,
      'teacher': instance.teacher,
      'sub_type': instance.subType,
      'time_cycle': instance.timeCycle,
      'subject_type': instance.subjectType,
      'subs_info': instance.subsInfo,
      'quota': instance.quota,
      'ordered': instance.ordered,
      'goods_id': instance.goodsId,
      'goods_type': instance.goodsType,
      'season': instance.season,
      'grade': instance.grade,
      'user_state': instance.userState,
      'order_state': instance.orderState,
      'desp': instance.desp,
      'order_begin_at': instance.orderBeginAt,
      'order_dead_line_at': instance.orderDeadLineAt,
      'online': instance.online,
      'real_price': instance.realPrice,
      'pre_days': instance.preDays,
      'module': instance.module,
      'order_no': instance.orderNo,
      'activity_type': instance.activityType,
      'difficult': instance.difficult,
      'course_belong': instance.courseBelong,
      'teachers_info': instance.teachersInfo,
      'cart_exist': instance.cartExist,
      'material_goods_id': instance.materialGoodsId,
      'material_goods_price': instance.materialGoodsPrice,
      'union_ids': instance.unionIds,
      'content_type': instance.contentType,
      'is_visible': instance.isVisible,
    };

Subs_info _$Subs_infoFromJson(Map<String, dynamic> json) => Subs_info(
      json['subclass_id'] as int,
      json['begin_at'] as int,
      json['end_at'] as int,
      json['price'] as int,
      json['teacher_id'] as int,
      json['teacher_name'] as String,
      json['sub_index'] as int,
      json['original_price'] as int,
    );

Map<String, dynamic> _$Subs_infoToJson(Subs_info instance) => <String, dynamic>{
      'subclass_id': instance.subclassId,
      'begin_at': instance.beginAt,
      'end_at': instance.endAt,
      'price': instance.price,
      'teacher_id': instance.teacherId,
      'teacher_name': instance.teacherName,
      'sub_index': instance.subIndex,
      'original_price': instance.originalPrice,
    };

Teachers_info _$Teachers_infoFromJson(Map<String, dynamic> json) =>
    Teachers_info(
      json['formal_intro'] as String,
      json['gender'] as int,
      json['id'] as int,
      json['interest_intro'] as String,
      json['level'] as int,
      json['picture'] as String,
      json['teacher_name'] as String,
      json['unique_name'] as String,
    );

Map<String, dynamic> _$Teachers_infoToJson(Teachers_info instance) =>
    <String, dynamic>{
      'formal_intro': instance.formalIntro,
      'gender': instance.gender,
      'id': instance.id,
      'interest_intro': instance.interestIntro,
      'level': instance.level,
      'picture': instance.picture,
      'teacher_name': instance.teacherName,
      'unique_name': instance.uniqueName,
    };
