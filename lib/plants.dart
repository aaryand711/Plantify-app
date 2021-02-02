// To parse this JSON data, do
//
//     final plant = plantFromJson(jsonString);

import 'dart:convert';

Plant plantFromJson(String str) => Plant.fromJson(json.decode(str));

String plantToJson(Plant data) => json.encode(data.toJson());

class Plant {
  Plant({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  PlantLinks links;
  Meta meta;

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: PlantLinks.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.commonName,
    this.slug,
    this.scientificName,
    this.year,
    this.bibliography,
    this.author,
    this.status,
    this.rank,
    this.familyCommonName,
    this.genusId,
    this.imageUrl,
    this.synonyms,
    this.genus,
    this.family,
    this.links,
  });

  int id;
  String commonName;
  String slug;
  String scientificName;
  int year;
  String bibliography;
  String author;
  Status status;
  Rank rank;
  String familyCommonName;
  int genusId;
  String imageUrl;
  List<String> synonyms;
  String genus;
  String family;
  DatumLinks links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    commonName: json["common_name"],
    slug: json["slug"],
    scientificName: json["scientific_name"],
    year: json["year"],
    bibliography: json["bibliography"],
    author: json["author"],
    status: statusValues.map[json["status"]],
    rank: rankValues.map[json["rank"]],
    familyCommonName: json["family_common_name"] == null ? null : json["family_common_name"],
    genusId: json["genus_id"],
    imageUrl: json["image_url"],
    synonyms: List<String>.from(json["synonyms"].map((x) => x)),
    genus: json["genus"],
    family: json["family"],
    links: DatumLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "common_name": commonName,
    "slug": slug,
    "scientific_name": scientificName,
    "year": year,
    "bibliography": bibliography,
    "author": author,
    "status": statusValues.reverse[status],
    "rank": rankValues.reverse[rank],
    "family_common_name": familyCommonName == null ? null : familyCommonName,
    "genus_id": genusId,
    "image_url": imageUrl,
    "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
    "genus": genus,
    "family": family,
    "links": links.toJson(),
  };
}

class DatumLinks {
  DatumLinks({
    this.self,
    this.plant,
    this.genus,
  });

  String self;
  String plant;
  String genus;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    self: json["self"],
    plant: json["plant"],
    genus: json["genus"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "plant": plant,
    "genus": genus,
  };
}

enum Rank { SPECIES }

final rankValues = EnumValues({
  "species": Rank.SPECIES
});

enum Status { ACCEPTED }

final statusValues = EnumValues({
  "accepted": Status.ACCEPTED
});

class PlantLinks {
  PlantLinks({
    this.self,
    this.first,
    this.prev,
    this.next,
    this.last,
  });

  String self;
  String first;
  String prev;
  String next;
  String last;

  factory PlantLinks.fromJson(Map<String, dynamic> json) => PlantLinks(
    self: json["self"],
    first: json["first"],
    prev: json["prev"],
    next: json["next"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "first": first,
    "prev": prev,
    "next": next,
    "last": last,
  };
}

class Meta {
  Meta({
    this.total,
  });

  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
