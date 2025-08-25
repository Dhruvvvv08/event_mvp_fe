import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:event_demo_mac/core/constants/widgets/dropdown.dart';
import 'package:event_demo_mac/features/auth/presentation/widgets/Titledinputfield.dart';
import 'package:event_demo_mac/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  final TextEditingController classcontroller = TextEditingController();
  final TextEditingController emergencycontactname = TextEditingController();
  final TextEditingController contactnumbercontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController weightcontroller = TextEditingController();
  final TextEditingController heightcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emergencycontactrelation;
  final List<String> states = [
    "Andhra Pradesh",
    "Bihar",
    "Delhi",
    "Gujarat",
    "Karnataka",
    "Maharashtra",
    "Punjab",
    "Rajasthan",
    "Tamil Nadu",
    "Uttar Pradesh",
    "West Bengal",
  ];

  final List<String> classList = [
    'Nursery',
    'KG',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  List<String> selectedAllergies = [];
  final List<String> allergyOptions = [
    'None',
    'Pollen',
    'Dust',
    'Nuts',
    'Gluten',
    'Lactose',
    'Seafood',
    'Pet Dander',
    'Insect Bites',
    'Medicines',
    'Others',
  ];
  final List<String> relationships = [
    'Mother',
    'Father',
    'Sibling',
    'Guardian',
    'Spouse',
    'Relative',
    'Friend',
    'Neighbor',
    'Other',
  ];
  File? _profileImage;
  bool get _allFieldsFilled {
    return namecontroller.text.isNotEmpty &&
        contactnumbercontroller.text.isNotEmpty &&
        dobcontroller.text.isNotEmpty &&
        selectedgender != null &&
        selectedenglishlevel != null &&
        heightcontroller.text.isNotEmpty &&
        weightcontroller.text.isNotEmpty &&
        selectedstate != null &&
        addresscontroller.text.isNotEmpty &&
        _profileImages.isNotEmpty;
  }

  List<File> _profileImages = [];

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  final pickedFiles = await ImagePicker().pickMultiImage();
                  if (pickedFiles != null && pickedFiles.isNotEmpty) {
                    setState(() {
                      _profileImages.addAll(
                        pickedFiles.map((file) => File(file.path)).toList(),
                      );
                    });
                  }
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _profileImages.add(File(pickedFile.path));
                    });
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method to remove an image
  void _removeImage(int index) {
    setState(() {
      _profileImages.removeAt(index);
    });
  }
  // Future<void> _pickImage() async {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SafeArea(
  //         child: Wrap(
  //           children: <Widget>[
  //             ListTile(
  //               leading: Icon(Icons.photo_library),
  //               title: Text('Choose from Gallery'),
  //               onTap: () async {
  //                 final pickedFile = await ImagePicker().pickImage(
  //                   source: ImageSource.gallery,
  //                 );
  //                 if (pickedFile != null) {
  //                   setState(() {
  //                     _profileImage = File(pickedFile.path);
  //                   });
  //                 }
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             ListTile(
  //               leading: Icon(Icons.camera_alt),
  //               title: Text('Take a Photo'),
  //               onTap: () async {
  //                 final pickedFile = await ImagePicker().pickImage(
  //                   source: ImageSource.camera,
  //                 );
  //                 if (pickedFile != null) {
  //                   setState(() {
  //                     _profileImage = File(pickedFile.path);
  //                   });
  //                 }
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  String? selectedAllergy;

  String? selectedgender;
  String? selectedstate;
  String? selectedenglishlevel;
  String? selectedclass;
  String? selectedbloodgroup;
  String? selectedallergy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Information",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff0D141C),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is Profileupdateloading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Profileupdatesuccess) {
            //    ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text(state.message)),
            // );
            //  Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => BottomNavBar()),
            //     );
          } else if (state is Profileupdateerror) {
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
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            backgroundImage:
                                _profileImage != null
                                    ? FileImage(_profileImage!)
                                    : null,
                            child:
                                _profileImage == null
                                    ? Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.white,
                                    )
                                    : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                _pickImage();
                              },

                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upload Photos",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),

                        // Display selected images in a grid
                        if (_profileImages.isNotEmpty)
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                            itemCount: _profileImages.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: FileImage(_profileImages[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () => _removeImage(index),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                      ],
                    ),

                    SizedBox(height: 20),
                    TitledInputField(
                      title: " Name",
                      hintText: "Name",
                      backgroundColor: Colors.white,

                      textEditingController: namecontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your namr';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TitledInputField(
                      title: " Contact Number",
                      hintText: "  Contact Number",
                      backgroundColor: Colors.white,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      textEditingController: contactnumbercontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter  contact number';
                        }
                        if (value.length != 10) {
                          return 'Please enter a valid 10-digit number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TitledInputField(
                            title: "Date of Birth",
                            textEditingController: dobcontroller,
                            backgroundColor: Colors.white,
                            onTap: () async {
                              FocusScope.of(
                                context,
                              ).requestFocus(FocusNode()); // Dismiss keyboard
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now().subtract(
                                  Duration(days: 365 * 10),
                                ),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                                helpText: 'Select your date of birth',
                                cancelText: 'Cancel',
                                confirmText: 'Select',
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Color(
                                          0xff0D141C,
                                        ), // Header color
                                        onPrimary:
                                            Colors.white, // Header text color
                                        onSurface:
                                            Colors.black, // Body text color
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Color(
                                            0xff0D141C,
                                          ), // Button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (picked != null) {
                                String formattedDate = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(picked);
                                dobcontroller.text = formattedDate;
                              }
                            },
                            validators: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select date of birth';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdownButton2(
                            buttonHeight: 50,
                            buttonWidth: double.infinity,

                            hint: "Enter Gender",
                            title: Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: selectedgender,
                            dropdownItems: ["Male", "Female", "Other"],
                            onChanged: (value) {
                              setState(() {
                                selectedgender = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomDropdownButton2(
                            buttonHeight: 50,
                            buttonWidth: double.infinity,

                            hint: "Enter English Level",
                            title: Text(
                              "English Level",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: selectedenglishlevel,
                            dropdownItems: [
                              "Beginner",
                              "Intermediate",
                              "Advanced",
                              "Fluent",
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedenglishlevel = value;
                              });
                            },
                          ),
                        ),
                      
                      ],
                    ),

                    SizedBox(height: 10),

                   
                    Row(
                      children: [
                        Expanded(
                          child: TitledInputField(
                            hintText: "Enter Height(in cm)",
                            title: "Height",
                            backgroundColor: Colors.white,
                            textEditingController: heightcontroller,
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
                            hintText: "Enter Weight(in kg)",
                            title: "Weight",
                            backgroundColor: Colors.white,
                            textEditingController: weightcontroller,
                            validators: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Weight';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomDropdownButton2(
                      buttonHeight: 50,
                      buttonWidth: double.infinity,
                      dropdownWidth: 380,

                      hint: "Enter State",
                      title: Text(
                        "State",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: selectedstate,
                      dropdownItems: states.toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedstate = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),

                    TitledInputField(
                      title: "Address ",
                      hintText: "Enter Full Address",
                      backgroundColor: Colors.white,
                      // inputFormatters: [
                      //   // FilteringTextInputFormatter.digitsOnly,
                      //   // LengthLimitingTextInputFormatter(10),
                      // ],
                      textEditingController: addresscontroller,
                      validators: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Address';
                        }

                        return null;
                      },
                    ),

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
                            if (_formKey.currentState!.validate() && _allFieldsFilled) {
                            context.read<ProfileBloc>().add(
                              ProfileUpdateevent({
                                "dateofBirth": dobcontroller.text,
                                "name": namecontroller.text,
                                "address": addresscontroller.text,
                                "height": heightcontroller.text,
                                "weight": weightcontroller.text,
                                "phone_number": contactnumbercontroller.text,
                                "gender": selectedgender.toString(),
                                "english_level": selectedenglishlevel.toString(),
                                "state": selectedstate.toString(),
                                "date_of_birth": dobcontroller.text,
                              },
                              _profileImages
                              ),
                            );
                          } else {
                            // Show error message if validation fails
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  _profileImages.isEmpty 
                                    ? 'Please select at least one image' 
                                    : 'Please fill all required fields'
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                          // context.read<ProfileBloc>().add(
                          //   ProfileUpdateevent({
                          //     "dateofBirth": dobcontroller.text,
                          //     "name":namecontroller.text,
                          //     "address": addresscontroller.text,
                          //     "height": heightcontroller.text,
                          //     "weight": weightcontroller.text,
                          //     "phone_number":contactnumbercontroller.text,
                          //     "gender": selectedgender.toString(),
                          //     "english_level": selectedenglishlevel.toString(),
                          //     "state": selectedstate.toString(),
                          //     "date_of_birth": dobcontroller.text,
                              
                          //   },
                          //     _profileImages
                            
                          //   ),
                          // );
                       
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
          if (state is Profileupdatesuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Profile Updated Successfully")),
            );
          } else if (state is Profileupdateerror) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(" ${state.message}")));
          }
        },
      ),
    );
  }
}
