import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc(this._userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInLoading());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess()); // Add this to emit success state after successful login
      } catch (e) {
        emit(SignInFailure());
      }
    });
    on<SignOutRequired>(  (event, emit) async =>
    await _userRepository.logOut());


  }
}


// class SignInBloc extends Bloc<SignInEvent, SignInState> {
//   final UserRepository _userRepository;
//
//   SignInBloc(this._userRepository) : super(SignInInitial()) {
//     on<SignInRequired>((event, emit) async {
//       emit(SignInLoading());
//       try {
//         await _userRepository.signIn(event.email, event.password);
//         emit(SignInSuccess());
//       } catch (e) {
//         emit(SignInFailure(error: e)); // Pass the error object
//       } finally {
//         // Optional cleanup logic (e.g., closing connections)
//       }
//     });
//     on<SignOutEvent>(async (event, emit) => {
//     await _userRepository.logOut();
//     emit(SignedOut()); // Consider emitting a SignedOut state
//     });
//   }
// }
