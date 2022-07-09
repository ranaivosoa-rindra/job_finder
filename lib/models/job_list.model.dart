import 'package:flutter/material.dart';
import 'package:job_finder/models/job.model.dart';

class JobList extends ChangeNotifier {
  final List<Job> _jobs = [];

  void addJob(Job job) {
    _jobs.add(job);
    notifyListeners();
  }

  List<Job> get jobs => _jobs;
}
