// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Job {
  final String job_title;
  final String entreprise;
  final String location;
  final String experience;
  final String job_type;
  final String mounthly_salary;
  Job({
    required this.job_title,
    required this.entreprise,
    required this.location,
    required this.experience,
    required this.job_type,
    required this.mounthly_salary,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'job_title': job_title,
      'entreprise': entreprise,
      'location': location,
      'experience': experience,
      'job_type': job_type,
      'mounthly_salary': mounthly_salary,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      job_title: map['job_title'] ?? "",
      entreprise: map['entreprise'] ?? "",
      location: map['location'] ?? "",
      experience: map['experience'] ?? "",
      job_type: map['job_type'] ?? "",
      mounthly_salary: map['mounthly_salary'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source) as Map<String, dynamic>);
}
