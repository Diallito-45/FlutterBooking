class City {
    City({
        this.id,
        this.name,
        this.contry,
    });

    final String id;
    final String name;
    final String contry;

    static City fromJson(dynamic json) { 
      return  City(
        id: json["id"] as String,
        name: json["name"] as String,
        contry: json["contry"] as String,
    );
  }
}
