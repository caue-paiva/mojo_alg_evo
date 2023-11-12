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
no mojo tem um tipo de dado estranho chamado SIMD (sei la oq é) mas para vc tornar ele normal vc usa .value eu acho

ex: let i: Int = random_si64(10,20).value


