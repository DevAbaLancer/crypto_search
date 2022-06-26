// To parse this JSON data, do
//
//     final cryptoModel = cryptoModelFromJson(jsonString);

import 'dart:convert';

class CryptoModel {
  CryptoModel({
    this.status,
    this.data,
  });

  final Status? status;
  final Map<String, Datum>? data;

  factory CryptoModel.fromRawJson(String str) =>
      CryptoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        status: Status.fromJson(json["status"]),
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "status": status!.toJson(),
        "data": Map.from(data!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.isActive,
    this.platform,
    this.cmcRank,
    this.isFiat,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.tvlRatio,
    this.lastUpdated,
    this.quote,
  });

  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final int? numMarketPairs;
  final DateTime? dateAdded;
  final List<String>? tags;
  final int? maxSupply;
  final double? circulatingSupply;
  final double? totalSupply;
  final int? isActive;
  final dynamic platform;
  final int? cmcRank;
  final int? isFiat;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedMarketCap;
  final dynamic tvlRatio;
  final DateTime? lastUpdated;
  final Quote? quote;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        maxSupply: json["max_supply"] == null ? null : json["max_supply"],
        circulatingSupply: json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"].toDouble(),
        isActive: json["is_active"],
        platform: json["platform"],
        cmcRank: json["cmc_rank"],
        isFiat: json["is_fiat"],
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        tvlRatio: json["tvl_ratio"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded!.toIso8601String(),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "max_supply": maxSupply == null ? null : maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "is_active": isActive,
        "platform": platform,
        "cmc_rank": cmcRank,
        "is_fiat": isFiat,
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_market_cap": selfReportedMarketCap,
        "tvl_ratio": tvlRatio,
        "last_updated": lastUpdated!.toIso8601String(),
        "quote": quote!.toJson(),
      };
}

class Quote {
  Quote({
    this.usd,
  });

  final Usd? usd;

  factory Quote.fromRawJson(String str) => Quote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd!.toJson(),
      };
}

class Usd {
  Usd({
    this.price,
    this.volume24H,
    this.volumeChange24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.percentChange30D,
    this.percentChange60D,
    this.percentChange90D,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.tvl,
    this.lastUpdated,
  });

  final double? price;
  final double? volume24H;
  final double? volumeChange24H;
  final double? percentChange1H;
  final double? percentChange24H;
  final double? percentChange7D;
  final double? percentChange30D;
  final double? percentChange60D;
  final double? percentChange90D;
  final double? marketCap;
  final double? marketCapDominance;
  final double? fullyDilutedMarketCap;
  final dynamic tvl;
  final DateTime? lastUpdated;

  factory Usd.fromRawJson(String str) => Usd.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"].toDouble(),
        volume24H: json["volume_24h"].toDouble(),
        volumeChange24H: json["volume_change_24h"].toDouble(),
        percentChange1H: json["percent_change_1h"].toDouble(),
        percentChange24H: json["percent_change_24h"].toDouble(),
        percentChange7D: json["percent_change_7d"].toDouble(),
        percentChange30D: json["percent_change_30d"].toDouble(),
        percentChange60D: json["percent_change_60d"].toDouble(),
        percentChange90D: json["percent_change_90d"].toDouble(),
        marketCap: json["market_cap"].toDouble(),
        marketCapDominance: json["market_cap_dominance"].toDouble(),
        fullyDilutedMarketCap: json["fully_diluted_market_cap"].toDouble(),
        tvl: json["tvl"],
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "percent_change_30d": percentChange30D,
        "percent_change_60d": percentChange60D,
        "percent_change_90d": percentChange90D,
        "market_cap": marketCap,
        "market_cap_dominance": marketCapDominance,
        "fully_diluted_market_cap": fullyDilutedMarketCap,
        "tvl": tvl,
        "last_updated": lastUpdated!.toIso8601String(),
      };
}

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  final DateTime? timestamp;
  final int? errorCode;
  final dynamic errorMessage;
  final int? elapsed;
  final int? creditCount;
  final dynamic notice;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp!.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}
