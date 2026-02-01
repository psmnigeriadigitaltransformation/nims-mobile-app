/// Represents the various stages in the shipment/sample lifecycle.
///
/// Stages are ranked to indicate progression through the workflow.
/// Lower rank numbers indicate earlier stages in the process.
enum Stage {
  order(1, 'Order'),
  pending(1, 'Pending'),
  inTransit(2, 'In-Transit'),
  storage(3, 'Storage'),
  delivered(5, 'Delivered'),
  testing(5, 'Testing'),
  resultPicked(6, 'Result Picked'),
  closed(6, 'Closed'),
  resultReturned(7, 'Result Returned'),
  rejected(8, 'Rejected'),
  loss(9, 'Loss');

  final int rank;
  final String displayName;

  const Stage(this.rank, this.displayName);

  /// Returns the stage from its display name (case-insensitive).
  /// Returns null if no match is found.
  static Stage? fromDisplayName(String? name) {
    if (name == null || name.isEmpty) return null;
    final lowerName = name.toLowerCase();
    for (final stage in Stage.values) {
      if (stage.displayName.toLowerCase() == lowerName) {
        return stage;
      }
    }
    return null;
  }

  /// Returns the stage from its name (enum name, case-insensitive).
  /// Returns null if no match is found.
  static Stage? fromName(String? name) {
    if (name == null || name.isEmpty) return null;
    final lowerName = name.toLowerCase();
    for (final stage in Stage.values) {
      if (stage.name.toLowerCase() == lowerName) {
        return stage;
      }
    }
    return null;
  }

  /// Compares two stages by rank.
  /// Returns negative if this stage comes before other,
  /// zero if same rank, positive if this stage comes after other.
  int compareByRank(Stage other) => rank.compareTo(other.rank);

  /// Returns true if this stage comes before the other stage (lower rank).
  bool isBefore(Stage other) => rank < other.rank;

  /// Returns true if this stage comes after the other stage (higher rank).
  bool isAfter(Stage other) => rank > other.rank;

  /// Returns true if this stage has the same rank as the other stage.
  bool isSameRank(Stage other) => rank == other.rank;

  /// Returns this stage capped by parentStage.
  /// If this stage has a higher rank than parent, return parent stage.
  Stage cappedBy(Stage parentStage) {
    return rank <= parentStage.rank ? this : parentStage;
  }

  /// Static helper to get capped display name from string stages.
  /// Returns the child's display name if its rank is <= parent's rank,
  /// otherwise returns the parent's display name (capped).
  static String getCappedDisplayName(String? childStage, String? parentStage) {
    final child = Stage.fromDisplayName(childStage);
    final parent = Stage.fromDisplayName(parentStage);
    if (child == null) return childStage ?? '';
    if (parent == null) return child.displayName;
    return child.cappedBy(parent).displayName;
  }

  @override
  String toString() => displayName;
}
