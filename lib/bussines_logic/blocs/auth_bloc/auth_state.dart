part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  
}

class Unauthenticated extends AuthState {}

class AuthFailed extends AuthState {
  final String? message;
  AuthFailed(this.message);
}

class AuthLoading extends AuthState {}