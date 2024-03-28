import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String pushMessageId;

  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message =
        context.watch<NotificationsBloc>().getMessageById(pushMessageId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: message != null
          ? _DetailsView(notification: message)
          : const Center(
              child: Text('Notificación no existe'),
            ),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage notification;

  const _DetailsView({required this.notification});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (notification.imageUrl != null)
            Image.network(notification.imageUrl!),
          const SizedBox(height: 16),
          Text(notification.title, style: textStyle.titleMedium),
          Text(notification.body),
          const Divider(),
          Text(notification.data.toString()),
        ],
      ),
    );
  }
}
