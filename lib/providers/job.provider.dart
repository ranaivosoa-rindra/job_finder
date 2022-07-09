import 'package:flutter/material.dart';
import 'package:job_finder/models/job.model.dart';

class JobProvider extends ChangeNotifier {
  Job _job = Job(
      title: '',
      company: '',
      companyUrl: '',
      location: '',
      description: "",
      datePosted: '');

  void setJob(String job) {
    _job = Job.fromJson(job);
    notifyListeners();
  }

  Job get job => _job;
}
