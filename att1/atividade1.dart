void main() {
  valores();
}

void valores() {
  var prod = Produto(preco: 2, descricao: "Capacete", validade: "2 anos");
  var prod2 = Produto(preco: 2, descricao: "Cinto", validade: "5 anos");
  var prod3 = Produto(preco: 3, descricao: "Chocolate", validade: "2025");
  var item = Item(quantidade: 5, produto: prod);
  var item2 = Item(quantidade: 20, produto: prod2);
  var item3 = Item(quantidade: 10, produto: prod3);
  var venda = Venda(data: "09/03/2020", itens: [item, item2, item3]);

  print("Produtos da venda: \n");
  venda.itens.forEach((itemVenda) {
    print(itemVenda.quantidade.toString() +
        " " +
        itemVenda.produto.descricao +
        ": R\$" +
        itemVenda.produto.preco.toString() +
        " unidade");
    print("Total produto: "+ (itemVenda.quantidade * itemVenda.produto.preco).toString() + "\n" );
  });

  print("\nValor total da venda: ");
  print(venda.total());
}

class Produto {
  double preco; //             /
  String descricao; //        /   ==> ATRIBUTOS
  String validade; //        /

  Produto(
      {required this.preco,
      required this.descricao,
      required this.validade}); // Construtor -> inicializar os objetos
}

class Item {
  int quantidade;
  Produto produto;

  double total() => quantidade * produto.preco;

  Item({required this.quantidade, required this.produto});
}

class Venda {
  String data;
  List<Item> itens;
  //Feito com base no código de Isayan
  double total() {
    //itens.fold(0,(sum,e)=>sum + e.total());
    var res = itens.reduce((value, element) {
      value.produto.preco = ((value.total() + element.total()) /
          (value.quantidade + element.quantidade));
      value.quantidade += element.quantidade;
      return value;
    });
    
    return res.total();
  }

  Venda({
    required this.data,
    required this.itens,
  });
}
