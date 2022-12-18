import 'package:json_annotation/json_annotation.dart';

part 'goods_list_model.g.dart';

@JsonSerializable()
class GoodsListModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  GoodsListModel(
    this.code,
    this.data,
  );

  factory GoodsListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$GoodsListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsListModelToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'total')
  double total;

  @JsonKey(name: 'list')
  List<GoodsList> list;

  Data(
    this.total,
    this.list,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class GoodsList extends Object {
  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'prices')
  GoodsList prices;

  @JsonKey(name: 'goods_id')
  double goodsId;

  @JsonKey(name: 'goods_type')
  double goodsType;

  @JsonKey(name: 'quota')
  double quota;

  @JsonKey(name: 'ordered')
  double ordered;

  @JsonKey(name: 'limit')
  double limit;

  GoodsList(
    this.cover,
    this.title,
    this.prices,
    this.goodsId,
    this.goodsType,
    this.quota,
    this.ordered,
    this.limit,
  );

  factory GoodsList.fromJson(Map<String, dynamic> srcJson) =>
      _$GoodsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsListToJson(this);
}

@JsonSerializable()
class Prices extends Object {
  @JsonKey(name: 'currency_type')
  String currencyType;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'currency_type_code')
  String currencyTypeCode;

  Prices(
    this.currencyType,
    this.price,
    this.currencyTypeCode,
  );

  factory Prices.fromJson(Map<String, dynamic> srcJson) =>
      _$PricesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PricesToJson(this);
}
