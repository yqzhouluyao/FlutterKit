// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsListModel _$GoodsListModelFromJson(Map<String, dynamic> json) =>
    GoodsListModel(
      json['code'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoodsListModelToJson(GoodsListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['total'] as num).toDouble(),
      (json['list'] as List<dynamic>)
          .map((e) => GoodsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'total': instance.total,
      'list': instance.list,
    };

GoodsList _$GoodsListFromJson(Map<String, dynamic> json) => GoodsList(
      json['cover'] as String,
      json['title'] as String,
      GoodsList.fromJson(json['prices'] as Map<String, dynamic>),
      (json['goods_id'] as num).toDouble(),
      (json['goods_type'] as num).toDouble(),
      (json['quota'] as num).toDouble(),
      (json['ordered'] as num).toDouble(),
      (json['limit'] as num).toDouble(),
    );

Map<String, dynamic> _$GoodsListToJson(GoodsList instance) => <String, dynamic>{
      'cover': instance.cover,
      'title': instance.title,
      'prices': instance.prices,
      'goods_id': instance.goodsId,
      'goods_type': instance.goodsType,
      'quota': instance.quota,
      'ordered': instance.ordered,
      'limit': instance.limit,
    };

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      json['currency_type'] as String,
      json['price'] as int,
      json['currency_type_code'] as String,
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'currency_type': instance.currencyType,
      'price': instance.price,
      'currency_type_code': instance.currencyTypeCode,
    };
