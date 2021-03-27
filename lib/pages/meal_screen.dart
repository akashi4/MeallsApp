import 'package:flutter/material.dart';
import 'package:mealsApp/dummy-data.dart';

class MealScreen extends StatelessWidget {
  static const route = '/meal_screen';

  Widget buildTitle(BuildContext ctx, String title) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(ctx).textTheme.headline6),
    );
  }

  Widget listBuilder(BuildContext ctx, Widget widget) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            //color: Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 1)),
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
                height: 300,
                width: double.infinity,
              ),
              buildTitle(context, "Ingredients"),
              listBuilder(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.all(2),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              selectedMeal.ingredients[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        //Divider()
                      ],
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildTitle(context, "Steps"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: listBuilder(
                    context,
                    ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                  leading: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      child: Text("${index + 1}")),
                                  title: Text(selectedMeal.steps[index])),
                              Divider()
                            ],
                          );
                        },
                        itemCount: selectedMeal.steps.length)),
              )
            ],
          ),
        ));
  }
}
