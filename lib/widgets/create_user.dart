import 'package:dio_networking/models/user_info.dart';
import 'package:dio_networking/utils/dio_client.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  late final TextEditingController _nameController;
  late final TextEditingController _jobController;

  final DioClient _dioClient = DioClient();

  bool isCreating = false;

  @override
  void initState() {
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
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Enter name'),
          ),
          TextField(
            controller: _jobController,
            decoration: InputDecoration(hintText: 'Enter job'),
          ),
          SizedBox(height: 16.0),
          isCreating
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isCreating = true;
                    });

                    if (_nameController.text != '' &&
                        _jobController.text != '') {
                      UserInfo userInfo = UserInfo(
                        name: _nameController.text,
                        job: _jobController.text,
                      );

                      UserInfo? retrievedUser =
                          await _dioClient.createUser(userInfo: userInfo);

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
                                    Text('ID: ${retrievedUser.id}'),
                                    Text('Name: ${retrievedUser.name}'),
                                    Text('Job: ${retrievedUser.job}'),
                                    Text(
                                      'Created at: ${retrievedUser.createdAt}',
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
                      isCreating = false;
                    });
                  },
                  child: Text(
                    'Create user',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
        ],
      ),
    );
  }
}
