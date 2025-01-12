// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:category/feature/auth/model/data_auth/data_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final DataAuth dataAuth = DataAuth();
  postDataCubit(
      {required nameData,
      required emailData,
      required phoneData,
      required nationalIdData,
      required genderData,
      required passwordData,
      required tokenData,
      required profileImageData}) async {
    emit(AuthLoading());
    var user = await dataAuth.PostData(
        name: nameData,
        email: emailData,
        phone: phoneData,
        nationalId: nationalIdData,
        gender: genderData,
        password: passwordData,
        token: tokenData,
        profileImage: profileImageData);
    emit(AuthSuccess(userData: user));
  }
}
