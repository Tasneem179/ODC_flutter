import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc11/business_logic/lectures/student_lecture_state.dart';
import 'package:odc11/data/data_provider/remote/dio_helper.dart';
import 'package:odc11/presentation/constants/constants.dart';
import 'package:odc11/presentation/constants/end_points.dart';

import '../../data/models/main/home/lecture_model.dart';



class StudentLectureCubit extends Cubit<StudentLectureStatus>{
  StudentLectureCubit():super(StudentLectureInitial());
  static StudentLectureCubit get(context)=> BlocProvider.of(context);

  LecturesModel ? studentLectureModel;

  Future<void>  getSection() async{
    emit(StudentLectureLoading());
    try {

      await DioHelper.getData(url: userLecturesEndPoint , token: token).then((value)  {
        studentLectureModel=LecturesModel.fromJson(value.data);
        emit(StudentLectureSuccess());
        print(studentLectureModel.toString());
      });

    }catch (e) {
      emit(StudentLectureFail());
    }}

  }
