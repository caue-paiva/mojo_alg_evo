import random
import time

# Geração de números aleatórios a partir do horário do sistema (garante que seja diferente a cada vez que o código é rodado)
gen = random.Random(time.time())

melhordetodos = 0.0

def Randomize(a, b):
    # Gera número de ponto flutuante e retorna
    return gen.uniform(a, b)

def Qualidade(a):
    # Relação que indica a maior qualidade para aqueles valores mais próximos de 10
    if a > 10:
        a = (20 - a)
    return a

def TorneioDeTres(a, b, c):
    # Compara o fitness de 3 indivíduos, retornando aquele com o maior fitness
    melhor = 0

    if Qualidade(a) > melhor:
        melhor = a

    if Qualidade(b) > Qualidade(melhor):
        melhor = b

    if Qualidade(c) > Qualidade(melhor):
        melhor = c

    return melhor

def main():
    global melhordetodos

    # Inicialização de uma população inicial com 15 indivíduos aleatórios
    populacao = [Randomize(0.0, 20.0) for _ in range(15)]

    # População inicial é mostrada
    #print("populacao original")
   # for i in range(15):
        #print(populacao[i])

    # Vetor que será usado para armazenar os 5 melhores de cada geração de indivíduos
    melhores = [0.0] * 5

    # Aqui é ajustado quantas vezes o processo se repetirá para aumentar ainda mais a qualidade da população
    for k in range(10000):

        # Definição de qual tem o melhor fitness naquela geração (mantém-se o antigo caso nenhum consiga superá-lo)
        for i in range(15):
            if Qualidade(populacao[i]) > Qualidade(melhordetodos):
                melhordetodos = populacao[i]

        for i in range(4):
            a = int(Randomize(0.0, 12.1))
            b = int(Randomize(0.0, 12.1))
            c = int(Randomize(0.0, 12.1))
            d = int(Randomize(0.0, 12.1))
            e = int(Randomize(0.0, 12.1))
            f = int(Randomize(0.0, 12.1))

            melhores[i] = (TorneioDeTres(populacao[a], populacao[b], populacao[c]) + TorneioDeTres(populacao[d], populacao[e], populacao[f])) / 2.0

        # Último indivíduo dos melhores recebe o melhor de todos
        melhores[4] = melhordetodos

        # Mutações que acontecem para a evolução da população
        for i in range(5):
            populacao[3 * i] = melhores[i]
            populacao[3 * i + 1] = melhores[i] + 0.00001
            populacao[3 * i + 2] = melhores[i] - 0.00001

            # Resetar melhores
            melhores[i] = 0.0

        # População intermediária é mostrada para efeito de comparação da evolução
       # if k == 1000:
          #  print("populacao intermediaria")
           # for i in range(15):
              #  pass
               # print(populacao[i])

    # População final e o melhor de todos são mostrados
   # print("nova populacao")
   # for i in range(15):
       # pass
       # print(populacao[i])

   # print("melhor de todos:", melhordetodos)


# if __name__ == "__main__":
#     main()
