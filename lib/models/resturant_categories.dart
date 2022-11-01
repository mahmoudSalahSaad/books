class ResturantCategoriesModel {
  int restId;
  List<CatgeoriesList> catgeoriesList;

  ResturantCategoriesModel({this.restId, this.catgeoriesList});

  ResturantCategoriesModel.fromJson(Map<String, dynamic> json) {
    restId = json['rest_id'];
    if (json['catgeories_list'] != null) {
      catgeoriesList = [];
      json['catgeories_list'].forEach((v) {
        catgeoriesList.add(new CatgeoriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rest_id'] = this.restId;
    if (this.catgeoriesList != null) {
      data['catgeories_list'] =
          this.catgeoriesList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CatgeoriesList {
  int catgeoryId;
  String catgeoryTitle;
  List<CatgeoryProducts> catgeoryProducts;

  CatgeoriesList({this.catgeoryId, this.catgeoryTitle, this.catgeoryProducts});

  CatgeoriesList.fromJson(Map<String, dynamic> json) {
    catgeoryId = json['catgeory_id'];
    catgeoryTitle = json['catgeory_title'];
    if (json['catgeory_products'] != null) {
      catgeoryProducts = [];
      json['catgeory_products'].forEach((v) {
        catgeoryProducts.add(new CatgeoryProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catgeory_id'] = this.catgeoryId;
    data['catgeory_title'] = this.catgeoryTitle;
    if (this.catgeoryProducts != null) {
      data['catgeory_products'] =
          this.catgeoryProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CatgeoryProducts {
  int id;
  String title;
  String image;
  int price;
  String shortDescription;
  String haveSizes;

  CatgeoryProducts(
      {this.id,
      this.title,
      this.image,
      this.price,
      this.shortDescription,
      this.haveSizes});

  CatgeoryProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    shortDescription = json['short_description'];
    haveSizes = json['have_sizes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['short_description'] = this.shortDescription;
    data['have_sizes'] = this.haveSizes;
    return data;
  }
}
