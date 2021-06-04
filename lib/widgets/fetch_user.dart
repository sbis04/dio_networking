import 'package:dio_networking/models/user.dart';
import 'package:dio_networking/utils/dio_client.dart';
import 'package:flutter/material.dart';

class FetchUser extends StatefulWidget {
  const FetchUser({Key? key}) : super(key: key);

  @override
  _FetchUserState createState() => _FetchUserState();
}

class _FetchUserState extends State<FetchUser> {
  final TextEditingController _idController = TextEditingController();
  final DioClient _client = DioClient();

  bool _isFetching = false;
  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(hintText: 'Enter ID'),
              ),
            ),
            SizedBox(width: 16.0),
            _isFetching
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isFetching = true;
                      });

                      User? user = await _client.getUser(
                        id: _idController.text,
                      );

                      if (user != null) {
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
                                    Image.network(user.data.avatar),
                                    Text('ID: ${user.data.id}'),
                                    Text(
                                      'Name: ${user.data.firstName} ${user.data.lastName}',
                                    ),
                                    Text('Email: ${user.data.email}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      setState(() {
                        _isFetching = false;
                      });
                    },
                    child: Text('Fetch'),
                  ),
            SizedBox(width: 16.0),
            _isDeleting
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });
                      await _client.deleteUser(id: _idController.text);
                      final snackBar = SnackBar(
                        content: Text(
                          'User at id ${_idController.text} deleted!',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      setState(() {
                        _isDeleting = false;
                      });
                    },
                    child: Text('Delete'),
                  ),
          ],
        ),
      ),
    );
  }
}
