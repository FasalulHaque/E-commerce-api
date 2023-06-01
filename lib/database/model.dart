import 'package:floor/floor.dart';

@entity
class CardDb {
  @PrimaryKey(autoGenerate: true)
 final int id;
 final String title;
 final String price;
 final String description;
 final String category;
 final String image;

  @ignore
  bool isSelect = false;

   CardDb (
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  );
}
