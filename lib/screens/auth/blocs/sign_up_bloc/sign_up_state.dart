part of 'sign_up_bloc.dart';

 sealed class SignUpState extends Equatable {
const SignUpState();
@override
   List<Object> get props =>[];

}

class SignUpInitial extends SignUpState {}
class SignUpSuccess extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpFailure extends SignUpState {}
