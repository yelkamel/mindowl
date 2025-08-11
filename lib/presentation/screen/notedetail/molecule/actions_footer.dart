import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class ActionsFooter extends StatelessWidget {
  final VoidCallback? onQuizAll;
  final VoidCallback? onQuizIncomplete;
  final VoidCallback? onQuizFavorites;
  final VoidCallback? onMixedQuiz;
  final VoidCallback? onExport;

  const ActionsFooter({
    super.key,
    this.onQuizAll,
    this.onQuizIncomplete,
    this.onQuizFavorites,
    this.onMixedQuiz,
    this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 600),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onQuizAll,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Quiz All Exos'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onQuizIncomplete,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Quiz Incomplete'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: onQuizFavorites,
                  icon: Icon(Icons.favorite, color: Colors.grey[600]),
                  label: Text(
                    'Favorites',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                TextButton.icon(
                  onPressed: onMixedQuiz,
                  icon: Icon(Icons.shuffle, color: Colors.grey[600]),
                  label: Text(
                    'Mixed Quiz',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                TextButton.icon(
                  onPressed: onExport,
                  icon: Icon(Icons.share, color: Colors.grey[600]),
                  label: Text(
                    'Export',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}