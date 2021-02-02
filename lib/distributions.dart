// To parse this JSON data, do
//
//     final distribution = distributionFromJson(jsonString);

import 'dart:convert';

Distribution distributionFromJson(String str) => Distribution.fromJson(json.decode(str));

String distributionToJson(Distribution data) => json.encode(data.toJson());

class Distribution {
  Distribution({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  DistributionLinks links;
  Meta meta;

  factory Distribution.fromJson(Map<String, dynamic> json) => Distribution(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: DistributionLinks.fromJson(json["links"]),
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
    this.name,
    this.slug,
    this.tdwgCode,
    this.tdwgLevel,
    this.speciesCount,
    this.links,
    this.parent,
    this.children,
  });

  int id;
  String name;
  String slug;
  String tdwgCode;
  int tdwgLevel;
  int speciesCount;
  DatumLinks links;
  Datum parent;
  List<Datum> children;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    tdwgCode: json["tdwg_code"],
    tdwgLevel: json["tdwg_level"],
    speciesCount: json["species_count"],
    links: DatumLinks.fromJson(json["links"]),
    parent: json["parent"] == null ? null : Datum.fromJson(json["parent"]),
    children: json["children"] == null ? null : List<Datum>.from(json["children"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "tdwg_code": tdwgCode,
    "tdwg_level": tdwgLevel,
    "species_count": speciesCount,
    "links": links.toJson(),
    "parent": parent == null ? null : parent.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class DatumLinks {
  DatumLinks({
    this.self,
    this.plants,
    this.species,
  });

  String self;
  String plants;
  String species;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    self: json["self"],
    plants: json["plants"],
    species: json["species"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "plants": plants,
    "species": species,
  };
}

class DistributionLinks {
  DistributionLinks({
    this.self,
    this.first,
    this.next,
    this.last,
  });

  String self;
  String first;
  String next;
  String last;

  factory DistributionLinks.fromJson(Map<String, dynamic> json) => DistributionLinks(
    self: json["self"],
    first: json["first"],
    next: json["next"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "first": first,
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
