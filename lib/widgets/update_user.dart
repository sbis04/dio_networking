import 'package:dio_networking/models/user_info.dart';
import 'package:dio_networking/utils/dio_client.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key}) : super(key: key);

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  late final TextEditingController _idController;
  late final TextEditingController _nameController;
  late final TextEditingController _jobController;

  final DioClient _dioClient = DioClient();

  bool isUpdating = false;

  @override
  void initState() {
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _jobController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: _idController,
            decoration: InputDecoration(hintText: 'Enter ID'),
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Enter name'),
          ),
          TextField(
            controller: _jobController,
            decoration: InputDecoration(hintText: 'Enter job'),
          ),
          SizedBox(height: 16.0),
          isUpdating
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isUpdating = true;
                    });

                    if (_nameController.text != '' &&
                        _jobController.text != '') {
                      UserInfo userInfo = UserInfo(
                        name: _nameController.text,
                        job: _jobController.text,
                      );

                      UserInfo? retrievedUser = await _dioClient.updateUser(
                        userInfo: userInfo,
                        id: _idController.text,
                      );

                      if (retrievedUser != null) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Name: ${retrievedUser.name}'),
                                    Text('Job: ${retrievedUser.job}'),
                                    Text(
                                      'Updated at: ${retrievedUser.updatedAt}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }

                    setState(() {
                      isUpdating = false;
                    });
                  },
                  child: Text(
                    'Update user',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
        ],
      ),
    );
  }
}
