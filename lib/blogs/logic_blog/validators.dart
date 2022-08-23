import 'dart:async';

mixin Validators {
  final titleValidator = StreamTransformer<String?, String?>.fromHandlers(
      handleData: (data, sink) {
    if (data == null || data.length < 5) {
      sink.addError("please provide more than 35 characters ");
    } else {
      sink.add(data);
    }
  });

  final imgUrlValidator = StreamTransformer<String?, String?>.fromHandlers(
      handleData: (data, sink) {
    final urlRegex = RegExp(
        r'[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
    if (!urlRegex.hasMatch(data ?? "")) {
      sink.addError("Please provide a valid URL");
    } else {
      sink.add(data);
    }
  });

  final contentValidator = StreamTransformer<String?, String?>.fromHandlers(
      handleData: (data, sink) {
    if (data == null || data.length < 35) {
      sink.addError("please provide more than 35 characters ");
    } else {
      sink.add(data);
    }
  });
}
