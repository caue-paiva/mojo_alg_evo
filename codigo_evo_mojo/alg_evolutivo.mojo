from utils.vector import DynamicVector
from memory.unsafe import Pointer
from random import seed
from random import random_float64 , random_si64
from math import sqrt, pow , sin, cos

let TAM_POP: Int = 10
let se_fuder_mojo: Int64 =10
let DELTA: Float64 = 1.0
let VAR_MUT_ARR_SIZE: Int = 7
let OG_MUT: Float64 = 5.0
let MAXX_VAL: Float64 = 1000

var Total_gen: Int = 0
var gen_stagnated: Int = 0

var last_best_fit: Float64 = 0
var max_fit: Float64  = 0
var max_fit_index: Int = 0

var Current_mut: Float64 = OG_MUT
var mut_changes_vector: DynamicVector[Float64] = DynamicVector[Float64](10)
var mut_arr_index: Int = 0

fn random_mutation()->Float64:
    return (random_float64(max= MAXX_VAL) - (MAXX_VAL/2)) * (Current_mut/100.0)

fn set_mut_changes_vector():
    mut_changes_vector.push_back(0.1)
    mut_changes_vector.push_back(0.1)
    mut_changes_vector.push_back(1000)
    mut_changes_vector.push_back(10)
    mut_changes_vector.push_back(10)
    mut_changes_vector.push_back(10)
    mut_changes_vector.push_back(1)

fn natu_selection(pop_vector: DynamicVector[Float64], fit_vector: DynamicVector[Float64])-> DynamicVector[Float64]:
    var max_fit: Float64 = fit_vector[0]
    var new_pop: DynamicVector[Float64] = DynamicVector[Float64](TAM_POP)
    for i in range(1, TAM_POP):
        if fit_vector[i] > max_fit:
            max_fit = fit_vector[i]
            max_fit_index = i
    for i in range (TAM_POP):
        if i == max_fit_index:
            continue  
        new_pop.push_back(((pop_vector[i] + (pop_vector[max_fit_index]))/2) + random_mutation())
        # transa o melhor com todos
        if new_pop[i] > MAXX_VAL: #caso supere o valor maximo, o indv recebe o valor max
            new_pop[i] = MAXX_VAL
        elif new_pop[i] < 0: #caso fique negativo, faz ele ficar positivo
            new_pop[i] = new_pop[i] * -1.0
    
    return new_pop

fn init_pop()-> DynamicVector[Float64]:
    var pop: DynamicVector[Float64] = DynamicVector[Float64](TAM_POP)
    for i in range (TAM_POP):
        var x: Float64 =  random_float64(min = 0, max= MAXX_VAL)
        pop.push_back(x)
    return pop

fn init_fit()->DynamicVector[Float64]:
    var fit: DynamicVector[Float64] = DynamicVector[Float64](TAM_POP)
    for i in range(TAM_POP):
        fit.push_back(0)
    return fit

fn mut_calculation():
    if (float_abs(max_fit- last_best_fit) < DELTA):
        gen_stagnated += 1
    else:
        gen_stagnated = 0

    if gen_stagnated > 5:
        print("mutation time")
        if(mut_arr_index == VAR_MUT_ARR_SIZE -1):
            Current_mut = OG_MUT
        else:
            Current_mut = Current_mut * mut_changes_vector[mut_arr_index]
        mut_arr_index = (mut_arr_index+1) % VAR_MUT_ARR_SIZE
        gen_stagnated = 0
        
fn float_abs(value: Float64)-> Float64:
    return sqrt(pow(value, 2))

fn fit_func(x: Float64)-> Float64:
    return 5 * (2*cos(0.039*x) + 5*sin(0.05*x) + 0.5*cos(0.01*x) + 10*sin(0.07*x) + 5*sin(0.1*x) + 5*sin(0.035*x))*10+500

fn evaluation(pop_vector: DynamicVector[Float64], fit_vector: DynamicVector[Float64])-> DynamicVector[Float64]:
    var new_fit: DynamicVector[Float64] = DynamicVector[Float64](TAM_POP)
    var x: Float64
    var Func: Float64
    #print("\n", Total_gen)
    for i in range(TAM_POP):
        x = pop_vector[i]
        new_fit[i] = fit_func(x)
        if new_fit[i] > max_fit:
            max_fit = new_fit[i]
    return new_fit

fn tournament(pop_vector: DynamicVector[Float64], fit_vector: DynamicVector[Float64])-> DynamicVector[Float64]:
    var a:Int
    var b:Int
    var father1: Int
    var father2: Int

    var tempFit: Float64 = fit_vector[0]
    var temp_best_index: Int = 0
    var temp_pop: DynamicVector[Float64] = DynamicVector[Float64](TAM_POP)
    var final_pop: DynamicVector[Float64] = DynamicVector[Float64](TAM_POP)
    for i in range (1,TAM_POP):
        if(fit_vector[i] > max_fit):
            max_fit = fit_vector[i]
            max_fit_index = i
    
    for i in range (TAM_POP):  #copia o array pop para temp_pop
        temp_pop.push_back(pop_vector[i])

    for i in range (TAM_POP): #torneio de 2
        if i == max_fit_index:
            pass
        
        a = (random_si64(0,TAM_POP).value + 1) #escolhe 2 individuos random para ser pai 1 
        b = (random_si64(0,TAM_POP).value + 1)
            
        if fit_vector[a] > fit_vector[b]:
            father1 = a
        else:
            father1 = b
        
        a = (random_si64(0,TAM_POP).value + 1) #escolhe 2 individuos random para ser pai 1 
        b = (random_si64(0,TAM_POP).value + 1)
    
        if fit_vector[a] > fit_vector[b]:
            father2 = a
        else:
            father2 = b

        final_pop[i] = (temp_pop[father1] + temp_pop[father2])/2.0 + random_mutation()
   
   print("max_fit:", max_fit)
   return final_pop

fn ag():
    pass

fn main():
  set_mut_changes_vector()
  seed()
  var pop: DynamicVector[Float64] = init_pop()
  var fit: DynamicVector[Float64] = init_fit()

  for i in range(100):
    pop = natu_selection(pop, fit)
    fit = evaluation(pop, fit)
    pop = tournament(pop, fit)
    last_best_fit = max_fit
    print("last best fit:",  last_best_fit, "\n")
    Total_gen += 1

  