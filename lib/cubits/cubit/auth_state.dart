part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final List<String> goals;
  final Exception? exception;

  const AuthState({
    this.status = AuthStatus.initial,
    this.goals = const [],
    this.exception,
  });

  @override
  List<Object?> get props => [status, goals, exception];

  AuthState copyWith({
    AuthStatus? status,
    List<String>? goals,
    Exception? exception,
  }) {
    return AuthState(
      status: status ?? this.status,
      goals: goals ?? this.goals,
      exception: exception ?? this.exception,
    );
  }
}
