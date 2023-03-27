/* 
Considere a classe A, que pode ser fabricada com 3 parâmetros:
- Data String
- b, um objeto de uma outra classe (B)
- F, uma função que recebe dois inteiros e retorna um inteiro
*/

class A{
  String data;


  A(
    {
      required this.data
    }
  );
}
var a = A (
  data: "19/05/2023",
  b: B(),
  f: (int i, int j ) => 0
)

/* 
Considere a classe C, que pode fabricado com os seguintes parâmetros
- Inteiros, uma lista de inteiros
- mariaPrea, um objeto A
- g, uma função que recebe um A e retorna um String
*/

var c = C(
  inteiros: [0,1,2],
  mariaPrea: a,
  g: (A param) => param.data,
)