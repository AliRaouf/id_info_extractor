import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id_generator/blocs/id/id_cubit.dart';
import 'package:national_id_generator/screens/idscreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    IdCubit cubit = IdCubit.get(context);
    return BlocConsumer<IdCubit, IdState>(
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        width: screenwidth,
                        height: screenheight,
                        child: const Image(
                            image: AssetImage('assets/images/homepage.png'),
                            fit: BoxFit.cover)),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: screenheight * 0.45,
                                bottom: screenheight * 0.04),
                            width: screenwidth * 0.9,
                            height: screenheight * 0.1,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide.none),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.grey[600])),
                              onChanged: (name) {
                                cubit.userName = name;
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: screenheight * 0.05),
                          width: screenwidth * 0.9,
                          height: screenheight * 0.1,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.7),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(45),
                                    borderSide: BorderSide.none),
                                hintText: "National ID",
                                hintStyle: TextStyle(color: Colors.grey[600])),
                            onChanged: (number) {
                              cubit.nationalId = number;
                            },
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              cubit.identifyBirthYear();
                              cubit.identifyBirthMonth();
                              cubit.identifyBirthDay();
                              cubit.identifyGovernance();
                              cubit.identifyGender();
                              if(cubit.nationalId.length!=14){
                                null;
                              }else{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => IDScreen()));}
                              },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                side: MaterialStatePropertyAll(BorderSide(
                                    width: 5,
                                    style: BorderStyle.solid,
                                    color: Color(0xff3c585b)))),
                            child: const Text(
                              "Analyse user data",
                              style: TextStyle(color: Color(0xff3c585b)),
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
