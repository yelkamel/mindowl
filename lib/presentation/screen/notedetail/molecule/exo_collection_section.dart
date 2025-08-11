import 'package:flutter/material.dart';
import 'package:mindowl/model/exo.dart';
import 'package:layou_tools/layou_tools.dart';

enum ExoSortType { byCompletion, byDifficulty, byRecent }

class ExoCollectionSection extends StatefulWidget {
  final List<Exo> exos;
  final Function(Exo)? onExoPractice;
  final Function(Exo)? onExoFavorite;

  const ExoCollectionSection({
    super.key,
    required this.exos,
    this.onExoPractice,
    this.onExoFavorite,
  });

  @override
  State<ExoCollectionSection> createState() => _ExoCollectionSectionState();
}

class _ExoCollectionSectionState extends State<ExoCollectionSection> {
  ExoSortType sortType = ExoSortType.byCompletion;

  @override
  Widget build(BuildContext context) {
    final sortedExos = _getSortedExos();

    return EntranceFader(
      delay: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.all(16),
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
          children: [
            _buildExoHeader(),
            _buildExoSortOptions(),
            ...sortedExos.map(
              (exo) => _ExoCard(
                exo: exo,
                onPractice: () => widget.onExoPractice?.call(exo),
                onFavorite: () => widget.onExoFavorite?.call(exo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExoHeader() {
    final completedExos = widget.exos.where((e) => e.isMastered).length;
    final progress = widget.exos.isNotEmpty
        ? completedExos / widget.exos.length
        : 0.0;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(Icons.quiz_outlined, color: Colors.grey[600], size: 20),
          const SizedBox(width: 8),
          Text(
            'All Exos (${widget.exos.length})',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${(progress * 100).round()}% Complete',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExoSortOptions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'Sort by:',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(width: 12),
          _SortChip(
            label: 'Completion',
            type: ExoSortType.byCompletion,
            isSelected: sortType == ExoSortType.byCompletion,
            onTap: () => setState(() => sortType = ExoSortType.byCompletion),
          ),
          const SizedBox(width: 8),
          _SortChip(
            label: 'Difficulty',
            type: ExoSortType.byDifficulty,
            isSelected: sortType == ExoSortType.byDifficulty,
            onTap: () => setState(() => sortType = ExoSortType.byDifficulty),
          ),
          const SizedBox(width: 8),
          _SortChip(
            label: 'Recent',
            type: ExoSortType.byRecent,
            isSelected: sortType == ExoSortType.byRecent,
            onTap: () => setState(() => sortType = ExoSortType.byRecent),
          ),
        ],
      ),
    );
  }

  List<Exo> _getSortedExos() {
    final sortedExos = List<Exo>.from(widget.exos);

    switch (sortType) {
      case ExoSortType.byCompletion:
        sortedExos.sort((a, b) {
          if (a.isMastered && !b.isMastered) return 1;
          if (!a.isMastered && b.isMastered) return -1;
          return b.successRate.compareTo(a.successRate);
        });
        break;
      case ExoSortType.byDifficulty:
        sortedExos.sort((a, b) => a.difficulty.compareTo(b.difficulty));
        break;
      case ExoSortType.byRecent:
        sortedExos.sort((a, b) {
          final aTime = a.lastAttempted ?? a.createdAt;
          final bTime = b.lastAttempted ?? b.createdAt;
          return bTime.compareTo(aTime);
        });
        break;
    }

    return sortedExos;
  }
}

class _SortChip extends StatelessWidget {
  final String label;
  final ExoSortType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _SortChip({
    required this.label,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _ExoCard extends StatelessWidget {
  final Exo exo;
  final VoidCallback? onPractice;
  final VoidCallback? onFavorite;

  const _ExoCard({required this.exo, this.onPractice, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  exo.question ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _ExoStatusIcon(exo: exo),
            ],
          ),
          if (exo.type == ExoType.mcq) ...[
            const SizedBox(height: 12),
            ...exo.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isCorrect = index == exo.correctAnswer;
              final isUserAnswer = exo.userAnswer == index;

              return Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? Theme.of(context).colorScheme.tertiary.withOpacity(0.1)
                      : isUserAnswer && !isCorrect
                      ? Theme.of(context).colorScheme.error.withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isCorrect
                        ? Theme.of(
                            context,
                          ).colorScheme.tertiary.withOpacity(0.5)
                        : isUserAnswer && !isCorrect
                        ? Theme.of(context).colorScheme.error.withOpacity(0.3)
                        : Colors.grey[300]!,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '${String.fromCharCode(65 + index)}) $option',
                      style: TextStyle(
                        fontSize: 13,
                        color: isCorrect
                            ? Theme.of(context).colorScheme.tertiary
                            : isUserAnswer && !isCorrect
                            ? Theme.of(
                                context,
                              ).colorScheme.error.withOpacity(0.7)
                            : Colors.grey[700],
                      ),
                    ),
                    const Spacer(),
                    if (isCorrect)
                      Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 16,
                      ),
                    if (isUserAnswer && !isCorrect)
                      Icon(
                        Icons.close,
                        color: Theme.of(
                          context,
                        ).colorScheme.error.withOpacity(0.7),
                        size: 16,
                      ),
                  ],
                ),
              );
            }),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              _ExoMetadata(
                text: exo.difficultyStars,
                icon: Icons.star,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 16),
              _ExoMetadata(
                text: exo.statusText,
                icon: Icons.trending_up,
                color: exo.isMastered
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.secondary,
              ),
              const Spacer(),
              if (exo.lastAttempted != null)
                Text(
                  exo.lastAttempted!.difference(DateTime.now()).inDays.abs() ==
                          0
                      ? 'Today'
                      : '${exo.lastAttempted!.difference(DateTime.now()).inDays.abs()}d ago',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onPractice,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: const Text('Practice', style: TextStyle(fontSize: 12)),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onFavorite,
                icon: Icon(
                  exo.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: exo.isFavorite
                      ? Theme.of(context).colorScheme.error
                      : Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExoStatusIcon extends StatelessWidget {
  final Exo exo;

  const _ExoStatusIcon({required this.exo});

  @override
  Widget build(BuildContext context) {
    if (!exo.isAnswered) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.help_outline, color: Colors.grey[600], size: 16),
      );
    }

    if (exo.isMastered) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      );
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: exo.isCorrect
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.secondary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        exo.isCorrect ? Icons.check : Icons.refresh,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}

class _ExoMetadata extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const _ExoMetadata({
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 14),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
