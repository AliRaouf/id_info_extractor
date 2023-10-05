part of 'id_cubit.dart';

@immutable
abstract class IdState {}

class IdInitial extends IdState {}
class IdentifyGenderStates extends IdState {}
class IdentifyGovernanceStates extends IdState {}
class IdentifyBirthDayStates extends IdState {}
class IdentifyBirthMonthStates extends IdState {}
class IdentifyBirthYearStates extends IdState {}