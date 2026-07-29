import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/about/about_page.dart';
import '../../features/backup/backup_page.dart';
import '../../features/home/home_page.dart';
import '../../features/library/library_page.dart';
import '../../features/record_edit/work_edit_page.dart';
import '../../features/search/import_confirm_page.dart';
import '../../features/search/search_page.dart';
import '../../features/settings/settings_page.dart';
import '../../features/work_detail/work_detail_page.dart';
import '../../models/metadata_search_result.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/library',
      builder: (context, state) => const LibraryPage(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: '/search/confirm',
      builder: (context, state) {
        final result = state.extra;
        if (result is! MetadataSearchResult) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              const SnackBar(
                content: Text('无法确认导入：缺少搜索数据，请重新搜索。'),
              ),
            );
          });
          return const SearchPage();
        }
        return ImportConfirmPage(initialResult: result);
      },
    ),
    GoRoute(
      path: '/works/new',
      builder: (context, state) => const WorkEditPage(),
    ),
    GoRoute(
      path: '/works/:id',
      builder: (context, state) {
        final workId = state.pathParameters['id'] ?? '';
        return WorkDetailPage(workId: workId);
      },
    ),
    GoRoute(
      path: '/works/:id/edit',
      builder: (context, state) {
        final workId = state.pathParameters['id'] ?? '';
        return WorkEditPage(workId: workId);
      },
    ),
    GoRoute(
      path: '/backup',
      builder: (context, state) => const BackupPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
  ],
);
