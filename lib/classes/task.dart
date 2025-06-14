// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String name,
    @Default(1) int point,
    @Default(false) bool isComplete,
    @Default(0.0) double progress,
    @Default(0) double step,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  
  @override
  // TODO: implement isComplete
  bool get isComplete => throw UnimplementedError();
  
  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
  
  @override
  // TODO: implement point
  int get point => throw UnimplementedError();
  
  @override
  // TODO: implement progress
  double get progress => throw UnimplementedError();
  
  @override
  // TODO: implement step
  double get step => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
  
}
