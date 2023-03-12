void main() {
  valores();
}

void valores() {
  var produto = Produto(2, "Capacete", "2 anos");
  var produto2 = Produto(4, "Cinto", "5 anos");
  var produto3 = Produto(3, "Chocolate", "2025");
  var item = Item(5, produto);
  var item2 = Item(20, produto2);
  var item3 = Item(10, produto3);
  var venda = Venda("09/03/2020", [item, item2, item3]);
  print("Valor total da venda: ");
  print(venda.total());
}

class Item {
  double quantidade;
  double total() => quantidade * produto.preco;
  Produto produto;

  Item(this.quantidade, this.produto);
}

class Venda {
  String data;
  List<Item> itens;
  //Feito com base no código de Isayan
  double total() {
    var res = itens.reduce((value, element) {
      value.produto.preco = ((value.total() + element.total()) /
          (value.quantidade + element.quantidade));
      value.quantidade += element.quantidade;
      return value;
    });
    return res.total();
  }

  Venda(
    this.data,
    this.itens,
  );
}

class Produto {
  double preco;
  String descricao;
  String validade;

  Produto(this.preco, this.descricao, this.validade);
}
