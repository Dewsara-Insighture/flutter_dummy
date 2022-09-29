class Quote {
  late String text;
  late String author;

  //Named Parameters. One of the good ways to assign values
  Quote({required this.text, required this.author});

  //  Quote(String t, String a) {
  //   text = t;
  //   author = a;
  // }
}

//Normal way of adding values to the Obj
// Quote myQuoteObj = Quote('First Quote Added', "Player 1");

//Adding value to object with named Parameters. Does not have to worry about the order since it is named parameters
// Quote myQuoteObj = Quote(author: "Player 1", text: 'First Quote Added');
