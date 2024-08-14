import 'package:bmi/pages/resultePage.dart';
import 'package:flutter/material.dart';


class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final _weightController = TextEditingController();
  final _heigtController = TextEditingController();

    @override
  void dispose() {
    _weightController.dispose();
    _heigtController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _weightController.text = '75';
    _heigtController.text = '1.7';
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),

      ),
      body: Column(
        children: [
          Text('Welcome', style: TextStyle(fontSize: 24),),
          SizedBox(height: 10,),

          Padding( 
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight',
                hintText: 'Enter the inpunt: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0)
                )
              ),
            ),
            
          ),
          SizedBox(height: 20,),
          Padding( 
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _heigtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height',
                hintText: 'Enter the height in meter ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0)
                )
              ),
            ),
            
          ),
          ElevatedButton(
            onPressed: _clculateBMI ,
            child: const Text('get you BMI '),
          )
        ],
      ),
    );
  }

  void  _clculateBMI(){
    if(_weightController.text.isEmpty){

      showMsg(context, 'Please provide a valid weight ');

      return;
    }
    if(_heigtController.text.isEmpty){

      return;
    }

    if(double.parse(_weightController.text) <= 0.0){
      showMsg(context, 'Weight must be greater then zero');

      return;
    }
    if(double.parse(_heigtController.text) <= 0.0){
      showMsg(context, 'heigt must be greater then zero');

      return;
    }
    // calculate at BMI 
    final weight = double.parse( _weightController.text);
    final heigh = double.parse( _heigtController.text);

    final bmi = weight / ( heigh*weight);
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(bmi: bmi,))
    );

 }
}

void showMsg(BuildContext context, String msg)=>

  ScaffoldMessenger.of(context)
  .showSnackBar(SnackBar(content: Text(msg)));