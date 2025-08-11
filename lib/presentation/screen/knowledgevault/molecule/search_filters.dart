import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SearchFilters extends StatelessWidget {
  final TextEditingController searchController;
  final Animation<double> searchAnimation;
  final String selectedFilter;
  final String sortBy;
  final Function(String) onFilterChanged;
  final Function(String) onSortChanged;
  final Function() onSearchChanged;

  const SearchFilters({
    super.key,
    required this.searchController,
    required this.searchAnimation,
    required this.selectedFilter,
    required this.sortBy,
    required this.onFilterChanged,
    required this.onSortChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          _buildSearchBar(context),
          if (searchAnimation.value > 0) const SizedBox(height: 16),
          _buildFilterRow(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return AnimatedBuilder(
      animation: searchAnimation,
      builder: (context, child) {
        return SizedBox(
          height: 56 * searchAnimation.value,
          child: Opacity(
            opacity: searchAnimation.value,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search notes and topics...',
                prefixIcon: const HeroIcon(
                  HeroIcons.magnifyingGlass,
                  size: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (_) => onSearchChanged(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(context, 'All'),
                const SizedBox(width: 8),
                _buildFilterChip(context, 'Favorites'),
                const SizedBox(width: 8),
                _buildFilterChip(context, 'Need Review'),
                const SizedBox(width: 8),
                _buildFilterChip(context, 'Mastered'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        PopupMenuButton<String>(
          icon: HeroIcon(
            HeroIcons.adjustmentsHorizontal,
            color: Theme.of(context).colorScheme.primary,
          ),
          onSelected: onSortChanged,
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'Recent', child: Text('Recent')),
            const PopupMenuItem(value: 'Score', child: Text('Score')),
            const PopupMenuItem(value: 'Title', child: Text('Title')),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChip(BuildContext context, String label) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () => onFilterChanged(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}