## problemas ao buildar mojo com libs de python

ao importar libs de python com "" let np = Python.import_module("builtins") "" você pode encontrar problemas ao dar build no programa (mas não em executar direto)

para resolver isso faça o seguinte: 

1) Baixe o miniconda: esse é um gerenciador de dependencias do python (uma versão mínima do gerenciador conda) https://docs.conda.io/projects/miniconda/en/latest/  (use o quick install) 

2) rode esse comando: echo $(ls $(conda info --base)/lib/libpython*)
copie o path parecido com esse: home/ubuntu/miniconda/base/lib/libpython3.11.so

3) inicie o ambiente miniconda: ~/miniconda3/bin/conda init bash  (reinicie o terminal para fazer efeito) agora vai ter uma (base) antes do nome de seu terminal, esse é um ambiente virtual do python para vc pode acessar as libs

4) nesse ambiente (base) rode o comando:  export MOJO_PYTHON_LIBRARY=/home/kap/miniconda3/lib/libpython3.11.so

5) agora o mojo vai ter acesso aos binários das libs de python e vai poder buildar essas libs e executá-las


## coisas estranhas das linguagem
1) no mojo tem um tipo de dado estranho chamado SIMD (sei la oq é) mas para vc tornar ele normal vc usa .value eu acho
ex: let i: Int = random_si64(10,20).value

2) Para uma variavel ser mutável numa função vc deve usar a palavra inout antes do argumento da função
ex:  fn teste(inout valor:Int):
         pass

3) para rodar codigo em python numa função fn (incluindo a fn main()), vc precisa colocar fn nome() raises: 
não sei pq dnv

4) PythonObjects e listas/tipos de dados em python
   var python_fit_array = PythonObject([]) #cria um pythonObject que é uma lista


## teste das linguagems (10000) gerações, função maluca e sem print nenhum

1) Python: média de 0.454ms

2) Mojo: média de 0.063ms (7.2 vezes mais rápido que python!!)

3) C++: média de 0.053ms

4) Mojo Compilando código em python: 0.368ms  (cerca de 81% do tempo que o python normal demora para rodar)