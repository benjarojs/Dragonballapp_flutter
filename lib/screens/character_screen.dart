import 'package:dragonball_app/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  final Character character;

  const CharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name!),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.35,
              width: double.infinity,
              child: Hero(tag: character.id!, child: Image.network(character.image!)),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: size.height * 0.14,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardData('Base Ki: ', character.ki!),
                  cardData('Total Ki: ', character.maxKi!),
                  cardData('Especie: ', character.race!)
                ],
              ),
            ),
            const Text('Caracteristicas: ' , style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Text(character.description!),
              )
              )
          ],
        ),
      ),
    
    );


  }

  
     Widget cardData(String text1, String text2){

      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(text1),
            Text(text2)
          ],
        ));
    
  }



 
}