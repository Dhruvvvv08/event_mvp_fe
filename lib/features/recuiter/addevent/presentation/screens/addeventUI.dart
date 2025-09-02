import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:event_demo_mac/core/constants/widgets/dropdown.dart';
import 'package:event_demo_mac/features/auth/presentation/widgets/Titledinputfield.dart';
import 'package:event_demo_mac/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:event_demo_mac/features/recuiter/addevent/presentation/controller/bloc/addevent_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddEventRecuiter extends StatefulWidget {
  const AddEventRecuiter({super.key});

  @override
  State<AddEventRecuiter> createState() => _AddEventRecuiterState();
}

class _AddEventRecuiterState extends State<AddEventRecuiter> {
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController classcontroller = TextEditingController();
  final TextEditingController emergencycontactname = TextEditingController();
  final TextEditingController workdetailscontroller = TextEditingController();
  final TextEditingController eventcompnaynamecontroller =
      TextEditingController();
  final TextEditingController workrequirnmentscontroller =
      TextEditingController();
  final TextEditingController responsibilitescontroller =
      TextEditingController();
  final TextEditingController totalworkforce = TextEditingController();
  final TextEditingController eventnamecontroller = TextEditingController();
  final TextEditingController weightcontroller = TextEditingController();
  final TextEditingController paymentperdaycontroller = TextEditingController();
  final TextEditingController paymentdaycontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _paymentdatecontroller = TextEditingController();

  DateTime? startDateTime;
  DateTime? endDateTime;
  DateTime? paymentdate;

  Future<void> _selectPaymentDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: paymentdate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(paymentdate ?? DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          paymentdate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _paymentdatecontroller.text = paymentdate.toString();
        });
      }
    }
  }

  Future<void> _selectStartDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDateTime ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(startDateTime ?? DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          startDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _startController.text = startDateTime.toString();
        });
      }
    }
  }

  Future<void> _selectEndDateTime() async {
    if (startDateTime == null) {
      // Show error if start is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select Start Date & Time first")),
      );
      return;
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: endDateTime ?? startDateTime!,
      firstDate: startDateTime!, // restrict end to be >= start
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(endDateTime ?? DateTime.now()),
      );

      if (pickedTime != null) {
        final selectedEnd = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        if (selectedEnd.isBefore(startDateTime!)) {
          // prevent invalid selection
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("End Date & Time must be after Start Date & Time"),
            ),
          );
          return;
        }

        setState(() {
          endDateTime = selectedEnd;
          _endController.text = endDateTime.toString();
        });
      }
    }
  }

  bool get _allFieldsFilled {
    return eventnamecontroller.text.isNotEmpty &&
        workdetailscontroller.text.isNotEmpty &&
        dobcontroller.text.isNotEmpty &&
        // selectedgender != null &&
        // selectedenglishlevel != null &&
        paymentperdaycontroller.text.isNotEmpty &&
        weightcontroller.text.isNotEmpty &&
        // selectedstate != null &&
        addresscontroller.text.isNotEmpty;
    //     _profileImages.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff0D141C),
      ),
      body: BlocConsumer<AddeventBloc, AddeventState>(
        builder: (context, state) {
          if (state is uploaddataloading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is uploaddataloaded) {
            //    ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text(state.message)),
            // );
            //  Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => BottomNavBar()),
            //     );
          } else if (state is uploaddataerror) {
            //    ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text(state.message)),
            // );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TitledInputField(
                      title: "Event Name",
                      hintText: "Event Name",
                      backgroundColor: Colors.white,

                      textEditingController: eventnamecontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your event name';
                        }

                        return null;
                      },
                    ),
                     SizedBox(height: 10),
                    TitledInputField(
                      title: "Organizer Name",
                      hintText: "Event Organizer Name",
                      backgroundColor: Colors.white,

                      textEditingController: eventcompnaynamecontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Event Company Name';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TitledInputField(
                      title: "Location",
                      hintText: "Enter location",
                      backgroundColor: Colors.white,
                      textEditingController: locationcontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event location';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TitledInputField(
                      title: "Work",
                      hintText: "Enter work Details",
                      backgroundColor: Colors.white,
                      textEditingController: workdetailscontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event location';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // TitledInputField(
                    //   title: "Requirments",
                    //   hintText: "Enter work Requirment",
                    //   backgroundColor: Colors.white,
                    //   textEditingController: workrequirnmentscontroller,
                    //   validators: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter  work Requirment';
                    //     }

                    //     return null;
                    //   },
                    // ),
                  
                    TitledInputField(
                      title: "Responsibilites",
                      hintText: "Enter work Responsibilites",
                      backgroundColor: Colors.white,
                      textEditingController: responsibilitescontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter  work Responsibilites';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TitledInputField(
                      title: "Total Workforce Needed",
                      hintText: "Enter Volunteers",
                      backgroundColor: Colors.white,
                      textEditingController: totalworkforce,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter No of Workforce Needed ';
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 10),

                    TitledInputField(
                      title: "Start Date And Time",
                      readOnly: true,
                      onTap: _selectStartDateTime,
                      textEditingController: _startController,
                      hintText: "Select Start Date And Time",
                      backgroundColor: Colors.white,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Start Date';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TitledInputField(
                      title: "End Date And Time",
                      onTap: _selectEndDateTime,
                      textEditingController: _endController,
                      hintText: "Select End Date And Time",
                      backgroundColor: Colors.white,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please End Date';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TitledInputField(
                            hintText: "Enter Payment(per day)",
                            title: "Payment",
                            backgroundColor: Colors.white,
                            textEditingController: paymentperdaycontroller,
                            validators: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Height';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TitledInputField(
                            hintText: "Enter Payment Date",
                            title: "Payment Date",
                            backgroundColor: Colors.white,
                            onTap: _selectPaymentDateTime,
                            readOnly: true,
                            textEditingController: _paymentdatecontroller,
                            validators: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Payment Date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    //            ElevatedButton(
                    //  onPressed: _selectStartDateTime,
                    //     child: Text(startDateTime == null
                    //         ? "Select Start Date & Time"
                    //         : "Start: ${startDateTime.toString()}"),
                    //   ),
                    //   const SizedBox(height: 16),
                    //   ElevatedButton(
                    //     onPressed: _selectEndDateTime,
                    //     child: Text(endDateTime == null
                    //         ? "Select End Date & Time"
                    //         : "End: ${endDateTime.toString()}"),
                    //   ),
                    SizedBox(height: 50),
                    Container(
                      height: 40,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffEB2933),
                          ),
                        ),

                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (startDateTime == null ||
                                endDateTime == null ||
                                paymentdate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Please select Start, End, and Payment Date & Time",
                                  ),
                                ),
                              );
                              return;
                            }

                            if (endDateTime!.isBefore(startDateTime!)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "End Date & Time must be after Start Date & Time",
                                  ),
                                ),
                              );
                              return;
                            }

                            if (paymentdate!.isBefore(endDateTime!)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Payment Date must be on or after End Date",
                                  ),
                                ),
                              );
                              return;
                            }

                            // Now safe to convert to UTC ISO8601
                            final startUtc =
                                startDateTime!.toUtc().toIso8601String();
                            final endUtc =
                                endDateTime!.toUtc().toIso8601String();
                            final paymentDateIso =
                                paymentdate!.toUtc().toIso8601String();

                            context.read<AddeventBloc>().add(
                              uploadataEvent({
                                "title": eventnamecontroller.text.trim(),
                                "content": workdetailscontroller.text.trim(),
                                "responsibility":
                                    responsibilitescontroller.text.trim(),
                                "requirement":
                                    workrequirnmentscontroller.text.trim(),
                                "payment":
                                    int.tryParse(
                                      paymentperdaycontroller.text.trim(),
                                    ) ??
                                    0,
                                "paymentDate": paymentDateIso,
                                "location": locationcontroller.text.trim(),
                                "total":
                                    int.tryParse(totalworkforce.text.trim()) ??
                                    0,
                                "startDate": startUtc,
                                "endDate": endUtc,
                              }),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please fill all required fields",
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is uploaddataloaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Event Uploded Successfully")),
            );
          } else if (state is uploaddataerror) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(" ${state.message}")));
          }
        },
      ),
    );
  }
}
