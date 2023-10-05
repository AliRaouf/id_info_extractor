import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../blocs/id/id_cubit.dart';
class IDScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    IdCubit cubit = IdCubit.get(context);
    return Scaffold(
      backgroundColor: Color(0xffc6e5f6),
      body: Stack(children: [
        Center(child: Image(image: AssetImage("assets/images/id.png"))),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(
                top: screenheight * 0.43, right: screenwidth * 0.05),
            child: Column(
              children: [
                Text("${cubit.userName}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenheight * 0.02),
                    child: Text(
                        "${cubit.birthYear}/${cubit.birthMonth}/${cubit.birthDay}",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text("${cubit.governance}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenheight * 0.02),
                    child: Text("${cubit.gender}",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text("${cubit.nationalId}",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
