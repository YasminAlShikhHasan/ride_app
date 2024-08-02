import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_app/core/model/handling_model.dart';
import 'package:ride_app/features/signup/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:ride_app/features/signup/presentation/bloc/auth_bloc/auth_state.dart';

import '../../../../../core/service/request/auth_srvice.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitialState()){
    on<Register>((event, emit) async{
      emit(LoadingState());
      ResultModel result = await AuthServiceImp().register(event.client);
      if(result is DataSuccess){
        emit(SuccessToRegister());
      }else{
        emit(FailedToRegister(message:result.runtimeType.toString()));
      }
    },);

    on<Login>((event, emit) async{
      emit(LoadingState());
      ResultModel result = await AuthServiceImp().login(event.user);
      if(result is DataSuccess){
        emit(SuccessToRegister());
      }else{
        emit(FailedToRegister(message:result.runtimeType.toString()));
      }
    },);
  }
} 
