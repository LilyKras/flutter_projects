import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color color;

  CategoryItem({@required this.title, this.color = Colors.orange, @required this.id});
  void selectCategory(BuildContext ctx, String cId, String cTitle) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName, arguments: {'id':cId, 'title':cTitle}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {selectCategory(context, id!, title!);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title!, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.2), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
