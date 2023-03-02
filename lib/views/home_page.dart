import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled11/view_models/list_of_articles_model_view.dart';

import '../models/article.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ArticlesListViewModel articlesListViewModel=ArticlesListViewModel();
  @override
  void initState() {
    super.initState();


   articlesListViewModel.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context)=>ArticlesListViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          title: const Text("NEWS APP"),
          centerTitle: true,
        ),
        body: Consumer<ArticlesListViewModel>(builder: (context,model,child){
          model.fetchArticles();
         return Column(

           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Text("country",style: TextStyle(fontSize: 12)),
                         SizedBox(width: 10),
                         myDropdownButton(model.country_value,model.countries.keys.toList(),model.change_country_value),
                       ],

                     ),
                     Row(
                       children: [
                         Text("category",style: TextStyle(fontSize: 12)),
                         SizedBox(width: 10),
                         myDropdownButton( model.category_value,model.categories,model.change_category_value),
                       ],

                     ),





                   ],
                 ),
               ),
             ),
             SizedBox(height: 5,),
             Expanded(
               child: ListView.builder(
                   scrollDirection: Axis.vertical,

                   shrinkWrap: true,
                   itemCount: model.articles.length,
                   itemBuilder: (context,index)
                   {
                     Article article=model.articles[index];
                     return GestureDetector(
                       onTap: (){model.openURL(index);},
                         child: mynewsCardItem(ImageUrl: article.imageUrl, title: article.title));
                   }),
             )
           ],
         );
        },)
      ),
    );
  }

  Widget myDropdownButton(String initValue,List<String> items,void Function(String?) func){
    return DropdownButton(
      borderRadius: BorderRadius.circular(20),

      style: const TextStyle(
        color: Colors.orange,
        fontSize: 10,
      ),

      // Initial Value
      value: initValue,
      menuMaxHeight: 200.0,
      // Down Arrow Icon
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.lightBlue,
      ),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? val)
        {
            func(val);
        }


    );
  }
  Widget mynewsCardItem({required String ImageUrl,required String title}){
    return Card(
      child: Column(
        children: [
          Image(image: ImageUrl!='urlImage' ?NetworkImage(ImageUrl):AssetImage('images/empty.jpg') as ImageProvider,),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,),),
          )

        ],
      ),
    );
    
  }
}
