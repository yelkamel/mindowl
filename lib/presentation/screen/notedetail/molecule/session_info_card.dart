import 'package:flutter/material.dart';
import 'package:mindowl/model/session.dart';
import 'package:layou_tools/layou_tools.dart';

class SessionInfoCard extends StatelessWidget {
  final Session session;

  const SessionInfoCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 200),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history, color: Colors.grey[600], size: 16),
                const SizedBox(width: 8),
                Text(
                  'Latest Session',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _SessionStat(
                    label: 'Duration',
                    value: session.formattedDuration,
                  ),
                ),
                Expanded(
                  child: _SessionStat(
                    label: 'Score',
                    value: '${((session.liveScore ?? 9999) * 100).round()}%',
                  ),
                ),
                Expanded(
                  child: _SessionStat(
                    label: 'Platform',
                    value: session.platform ?? 'audio',
                  ),
                ),
                Expanded(
                  child: _SessionStat(
                    label: 'Date',
                    value: session.formattedDate,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              session.context ?? 'ERROR',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionStat extends StatelessWidget {
  final String label;
  final String value;

  const _SessionStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
