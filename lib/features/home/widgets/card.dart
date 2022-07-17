// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/common/widgets/apply_button.dart';
import 'package:job_finder/common/widgets/global_job_button.dart';

class JobCard extends StatefulWidget {
  final Icon? icon;
  final Image? logoImage;
  final bool isImage;
  final String jobTitle;
  final String entreprise;
  final String location;
  final String mounthlySalary;
  final String experience;
  final String jobType;
  const JobCard(
      {Key? key,
      this.icon,
      this.logoImage,
      required this.jobTitle,
      required this.location,
      required this.mounthlySalary,
      required this.experience,
      required this.jobType,
      required this.isImage, 
      required this.entreprise})
      : super(key: key);

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.4,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFD6CDFE),
                      border: Border.all(color: Color(0xFFD6CDFE), width: 1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: (widget.isImage == false)
                        ? Center(
                            child: Icon(
                              Icons.apple,
                              size: 30,
                            ),
                          )
                        : widget.logoImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.jobTitle,
                          style: GoogleFonts.dmSans(
                              color: Color(0xFF150B3D),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                         "${widget.entreprise} . ${widget.location}",
                          style: GoogleFonts.dmSans(
                            color: Color(0xFF524B6B).withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                  child: Image.asset("assets/icons/Save_black.png"),
                  onTap: () {})
            ],
          ),
          Row(
            children: [
              Text(
                "\$${widget.mounthlySalary}",
                style: GoogleFonts.dmSans(
                    color: Color(0xFF150B3D),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "/Mo",
                style: GoogleFonts.dmSans(
                  color: Color(0xFF524B6B).withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JobButton(jobSpecificity: widget.experience),
              JobButton(jobSpecificity: widget.jobType),
              ApplyButton(),
            ],
          ),
        ],
      ),
    );
  }
}
