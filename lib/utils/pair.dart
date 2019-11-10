class Pair<T, U> {
  Pair(this.left, this.right);

  final T left;
  final U right;

  @override
  String toString() => 'Pair[$left, $right]';
}