import 'dart:convert';

CharacterResponse characterResponseFromJson(String str) => CharacterResponse.fromJson(json.decode(str));

String characterResponseToJson(CharacterResponse data) => json.encode(data.toJson());

class CharacterResponse {
    List<Character>? items;
    Meta? meta;
    Links? links;

    CharacterResponse({
        this.items,
        this.meta,
        this.links,
    });

    factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
        items: json["items"] == null ? [] : List<Character>.from(json["items"]!.map((x) => Character.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
        "links": links?.toJson(),
    };
}

class Character {
    int? id;
    String? name;
    String? ki;
    String? maxKi;
    String? race;
    String? gender;
    String? description;
    String? image;
    String? affiliation;
    dynamic deletedAt;

    Character({
        this.id,
        this.name,
        this.ki,
        this.maxKi,
        this.race,
        this.gender,
        this.description,
        this.image,
        this.affiliation,
        this.deletedAt,
    });

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        ki: json["ki"],
        maxKi: json["maxKi"],
        race: json["race"],
        gender: json["gender"],
        description: json["description"],
        image: json["image"],
        affiliation: json["affiliation"],
        deletedAt: json["deletedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ki": ki,
        "maxKi": maxKi,
        "race": race,
        "gender": gender,
        "description": description,
        "image": image,
        "affiliation": affiliation,
        "deletedAt": deletedAt,
    };
}

class Links {
    String? first;
    String? previous;
    String? next;
    String? last;

    Links({
        this.first,
        this.previous,
        this.next,
        this.last,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        previous: json["previous"],
        next: json["next"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "previous": previous,
        "next": next,
        "last": last,
    };
}

class Meta {
    int? totalItems;
    int? itemCount;
    int? itemsPerPage;
    int? totalPages;
    int? currentPage;

    Meta({
        this.totalItems,
        this.itemCount,
        this.itemsPerPage,
        this.totalPages,
        this.currentPage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalItems: json["totalItems"],
        itemCount: json["itemCount"],
        itemsPerPage: json["itemsPerPage"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "itemCount": itemCount,
        "itemsPerPage": itemsPerPage,
        "totalPages": totalPages,
        "currentPage": currentPage,
    };
}
