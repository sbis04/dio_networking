# Networking in Flutter using Dio

![](screenshots/dio_networking_cover.png)

This is a sample Flutter app for demonstrating how to perform network requests using the **Dio** package. For this demo API provided by [REQ | RES](https://reqres.in/) is used. 

The functionalities of Dio showcased in this app are as follows:

* GET request
* POST request
* PUT request
* DELETE request
* Base options
* Uploading files
* Interceptors

## Demonstration

| Request Type | Demo |
| --- | --- |
| **GET** | ![](screenshots/dio_get.gif) |
| **POST** | ![](screenshots/dio_post.gif) |
| **PUT** | ![](screenshots/dio_put.gif) |
| **DELETE** | ![](screenshots/dio_delete.gif) |

## Packages

The packages used in this app are as follows:

* [dio](https://pub.dev/packages/dio)
* [json_annotation](https://pub.dev/packages/json_annotation)
* [json_serializable](https://pub.dev/packages/json_serializable)
* [build_runner](https://pub.dev/packages/build_runner)

Add them to your `pubspec.yaml` file like this:

```yaml
dependencies:
  dio: ^4.0.0
  json_annotation: ^4.0.1

dev_dependencies:
  json_serializable: ^4.1.3
  build_runner: ^2.0.4
```

## License

Copyright (c) 2021 Souvik Biswas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
