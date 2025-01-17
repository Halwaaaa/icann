import 'package:hive/hive.dart';

part 'ResponsesModels.g.dart';

@HiveType(typeId: 9)
class ResponsesModels {
  @HiveField(0)
  final String response;

  @HiveField(1)
  final String createdAt;

  @HiveField(2)
  final int delegateReading;

  @HiveField(3)
  final int customerReading;

  @HiveField(4)
  final int staffReading;

  @HiveField(5)
  final int centralReading;

  @HiveField(6)
  final int followBranchReading;

  @HiveField(7)
  final String createdBy;

  ResponsesModels({
    required this.response,
    required this.createdAt,
    required this.delegateReading,
    required this.customerReading,
    required this.staffReading,
    required this.centralReading,
    required this.followBranchReading,
    required this.createdBy,
  });

  // Factory لتحويل JSON إلى كائن Feedback
  factory ResponsesModels.fromJson(Map<String, dynamic> json) {
    return ResponsesModels(
      response: json['response'],
      createdAt: json['created_at'],
      delegateReading: json['delegate_reading'],
      customerReading: json['customer_reading'],
      staffReading: json['staff_reading'],
      centralReading: json['central_reading'],
      followBranchReading: json['follow_branch_reading'],
      createdBy: json['created_by'],
    );
  }

  // تحويل كائن ResponsesModels إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'response': response,
      'created_at': createdAt,
      'delegate_reading': delegateReading,
      'customer_reading': customerReading,
      'staff_reading': staffReading,
      'central_reading': centralReading,
      'follow_branch_reading': followBranchReading,
      'created_by': createdBy,
    };
  }
}
