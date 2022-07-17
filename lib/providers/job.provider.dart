import 'package:flutter/material.dart';
import 'package:job_finder/models/job.model.dart';

class JobProvider extends ChangeNotifier {
  Job _job = Job(
      job_title: "",
      entreprise: "",
      location: "",
      experience: "",
      job_type: "", 
      mounthly_salary: '');

  Job get job => _job;

  void setJob(String job) {
    _job = Job.fromJson(job);
    notifyListeners();
  }
}
