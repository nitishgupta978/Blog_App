import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:singup_app/auth/datasource/auth_repository.dart';
import 'package:singup_app/auth/datasource/i_auth_repository.dart';
import 'package:singup_app/blogs/datasource/i_blog_repository.dart';
import 'package:singup_app/common/network_client/network_client.dart';

import 'blogs/datasource/blog_repository.dart';

final networkClientProvider = Provider<INetworkClient>((ref) {
  return NetworkClient();
});

final authRepoProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository(ref.watch(networkClientProvider));
});
final blogRepoProvider = Provider<IBlogRepository>((ref) {
  return BlogRepository(ref.watch(networkClientProvider));
});
