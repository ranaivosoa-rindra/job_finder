import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Job {
  final String title;
  final String company;
  final String companyUrl;
  final String location;
  final String description;
  final String datePosted;
  Job({
    required this.title,
    required this.company,
    required this.companyUrl,
    required this.location,
    required this.description,
    required this.datePosted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'company': company,
      'companyUrl': companyUrl,
      'location': location,
      'description': description,
      'datePosted': datePosted,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      title: map['title'] ?? "",
      company: map['company'] ?? "",
      companyUrl: map['companyUrl'] ?? "",
      location: map['location'] ?? "",
      description: map['description'] ?? "",
      datePosted: map['datePosted'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);
}
