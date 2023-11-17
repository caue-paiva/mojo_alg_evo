import random
import math

TAM_POP = 10
DELTA = 1
VAR_MUT_ARR_SIZE = 7
OG_MUT = 5.0
maxx = 1000
arr_mut_changes = [0.1, 0.1, 1000, 10, 10, 10, 1]

MaxMut = OG_MUT
last_best_fit = 0.0
max_fit = 0.0
number_gen = 0
mut_arr_index = 0

def avalia(indi):
    fit = []
    for x in indi:
        y = 5 * (2 * math.cos(0.039 * x) + 5 * math.sin(0.05 * x) + 0.5 * math.cos(0.01 * x) + 10 * math.sin(0.07 * x) + 5 * math.sin(0.1 * x) + 5 * math.sin(0.035 * x)) * 10 + 500
        fit.append(y)
    return fit

def init_pop():
    return [random.uniform(0, maxx) for _ in range(TAM_POP)]

def sele_natu(indi, fit):
    global max_fit, maxi
    max_fit = max(fit)
    maxi = fit.index(max_fit)
    for i in range(TAM_POP):
        if i == maxi:
            continue
        indi[i] = (indi[i] + indi[maxi]) / 2.0
        indi[i] += (random.uniform(-maxx/2, maxx/2) * MaxMut / 100.0)
        indi[i] = min(maxx, max(0, indi[i]))
    return indi

def mut_calculation():
    global MaxMut, number_gen, mut_arr_index
    if abs(max_fit - last_best_fit) < DELTA:
        number_gen += 1
    else:
        number_gen = 0

    if number_gen > 5:
        if mut_arr_index == VAR_MUT_ARR_SIZE - 1:
            MaxMut = OG_MUT
            return True
        else:
            MaxMut *= arr_mut_changes[mut_arr_index]
        mut_arr_index = (mut_arr_index + 1) % VAR_MUT_ARR_SIZE
        number_gen = 0

    return False

def kill_them_all():
    return [random.uniform(0, maxx) for _ in range(TAM_POP)]

def torneio(fit, indi):
    global max_fit, maxi
    temp_indi = indi.copy()
    for i in range(TAM_POP):
        if i == maxi:
            continue

        a, b = random.randint(0, TAM_POP-1), random.randint(0, TAM_POP-1)
        pai1 = a if fit[a] > fit[b] else b

        a, b = random.randint(0, TAM_POP-1), random.randint(0, TAM_POP-1)
        pai2 = a if fit[a] > fit[b] else b

        indi[i] = (temp_indi[pai1] + temp_indi[pai2]) / 2.0
        indi[i] += (random.uniform(-maxx/2, maxx/2) / 100.0) * MaxMut

    if mut_calculation():
        indi = kill_them_all()
    return indi

def ag(indi, fit):
    global last_best_fit
    indi = sele_natu(indi, fit)
    fit = avalia(indi)
    indi = torneio(fit, indi)
    last_best_fit = max_fit
    return indi, fit

def roda():
    random.seed()
    individuals = init_pop()
    fitness = avalia(individuals)

    for _ in range(10000):
        individuals, fitness = ag(individuals, fitness)
        #print(max_fit)

# if __name__ == "__main__":
#     main()
