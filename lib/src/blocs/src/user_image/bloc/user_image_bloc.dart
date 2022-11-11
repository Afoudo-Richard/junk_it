import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:your_waste/src/blocs/src/authentication/bloc/authentication_bloc.dart';
import 'package:your_waste/src/data/data.dart';

part 'user_image_event.dart';
part 'user_image_state.dart';

class UserImageBloc extends Bloc<UserImageEvent, UserImageState> {
  UserImageBloc({
    required this.authenticationBloc,
  }) : super(UserImageState()) {
    on<SelectImage>(_onSelectImage);
  }

  final AuthenticationBloc authenticationBloc;

  void _onSelectImage(
    SelectImage event,
    Emitter<UserImageState> emit,
  ) async {
    try {
      var pickedFile =
          (await ImagePicker().pickImage(source: event.imageSource));

      if (pickedFile == null) throw Exception("Unable to get image");
      ParseFileBase? parseFile = ParseFile(File(pickedFile.path));
      await parseFile.save();
      User currentUser = authenticationBloc.state.user ?? User();
      User parseUser = await ParseUser.currentUser();

      parseUser.set(
        'profileImage',
        parseFile.url,
      );
      final response = await parseUser.save();

      // final user = User()
      //   ..objectId = currentUser.objectId
      //   ..set(
      //     'profileImage',
      //     parseFile.url,
      //   );
      // final response = await user.save();

      if (response.success) {
        currentUser.profileImage = parseFile.url;
        authenticationBloc.add(
          AuthenticationUserChanged(
            user: currentUser,
          ),
        );
      }
      emit(state.copyWith(pickedFile: pickedFile));
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  void selectImage(ImageSource imgsource) async {
    try {
      var pickedFile = (await ImagePicker().pickImage(source: imgsource))!;
      emit(state.copyWith(pickedFile: pickedFile));
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    } finally {
      print("Unable to open images");
    }
  }
}
