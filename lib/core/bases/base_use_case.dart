import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../helpers/auth_helper/data_state.dart';

///FOR FUTURE
abstract class BaseUseCase<T, Parameters>{
  Future<Either<DataFailedErrorMsg ,T>> call(Parameters parameters);
}

//
// ///For Stream
// abstract class StreamBaseUseCase<T, Parameters>{
//   Stream<T> call(Parameters parameters);
// }
//
//
//
class NoParameters extends Equatable{
  const NoParameters();
  @override
  List<Object?> get props => [];
}