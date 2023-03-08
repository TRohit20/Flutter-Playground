// This is not a widget but just a class for fake transactions to work with for the mean while

class Transactions {
  final String title;
  final double amount;
  final DateTime date;

  Transactions({required this.amount, required this.date, required this.title});
}
