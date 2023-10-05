import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'id_state.dart';
class IdCubit extends Cubit<IdState> {
  IdCubit() : super(IdInitial());

  static IdCubit get(context)=>BlocProvider.of(context);

  String? userName;
  String nationalId="";
  String? birthCentury;
  int birthYear=0;
  String? birthMonth;
  String? birthDay;
  String? cityCode;
  String? governance;
  String? gender;

  identifyBirthYear() {
    birthCentury=nationalId.substring(0,1);
    switch (birthCentury){
      case "1":{
        birthYear=1800;
      }
      case "2":{
        birthYear=1900;
      }
      case "3":{
        birthYear=2000;
      }
      case "4":{
        birthYear=2100;
      }break;
    }
    birthYear+=int.parse(nationalId.substring(1,3));
    emit(IdentifyBirthYearStates());
  }
  identifyBirthMonth(){
    birthMonth=nationalId.substring(3,5);
    emit(IdentifyBirthMonthStates());
  }
  identifyBirthDay(){
    birthDay=nationalId.substring(5,7);
    emit(IdentifyBirthDayStates());
  }
  identifyGovernance(){
    cityCode=nationalId.substring(7,9);
    switch (cityCode){
      case "01":{
        governance="Cairo";
      }
      case "02":{
        governance="Alexandria";
      }
      case "03":{
        governance="Port Said";
      }
      case "04":{
        governance="Suez";
      }
      case "11":{
        governance="Damietta";
      }
      case "12":{
        governance="Dakahlia";
      }
      case "13":{
        governance="Ash Sharqia";
      }
      case "14":{
        governance="Kaliobeya";
      }
      case "15":{
        governance="Kafr El -Sheikh";
      }
      case "16":{
        governance="Gharbia";
      }
      case "17":{
        governance="Monoufia";
      }
      case "18":{
        governance="El Beheira";
      }
      case "19":{
        governance="Ismailia";
      }
      case "21":{
        governance="Giza";
      }
      case "22":{
        governance="Beni Suef";
      }
      case "23":{
        governance="Fayoum";
      }
      case "24":{
        governance="El Menia";
      }
      case "25":{
        governance="Assiut";
      }
      case "26":{
        governance="Sohag";
      }
      case "27":{
        governance="Qena";
      }
      case "28":{
        governance="Aswan";
      }
      case "29":{
        governance="Luxor";
      }
      case "31":{
        governance="Red Sea";
      }
      case "32":{
        governance="New Valley";
      }
      case "33":{
        governance="Matrouh";
      }
      case "34":{
        governance="North Sinai";
      }
      case "35":{
        governance="South Sinai";
      }
      case "88":{
        governance="Foreign";
      }
    }
    emit(IdentifyGovernanceStates());
  }
  identifyGender(){
  int.parse(nationalId.substring(12,13))%2==0?gender="Female":gender="Male";
  emit(IdentifyGenderStates());
  }
  }