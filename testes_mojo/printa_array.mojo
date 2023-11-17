from python import PythonObject
from python import Python

let TAM_POP: Int  = 4

fn init_fit()->DynamicVector[Float64]:
    var fit: DynamicVector[Float64] = DynamicVector[Float64](TAM_POP)
    for i in range(TAM_POP):
        fit.push_back(1)
    return fit

fn printa_arr(array:ListLiteral): 
    for i in range(TAM_POP):
        var tmnc : Int = i
       # print(array.get[tmnc, Int]())

def comptime_for[i: Int, f: fn[i: Int]() capturing -> None]():
    @parameter 
    if 0 < i:
        comptime_for[i-1, f]()
        f[i-1]()

"""def main():
    alias A = ["a","b","c"]
    alias B = ["d","a","f"]
    fn foo[i: Int]():
        if A.get[i, StringLiteral]() == B.get[i+1, StringLiteral]():
            print(A.get[i, StringLiteral]())
    comptime_for[2, foo]()"""


fn main() raises:
    var fit2 = [1,2,3,4]
    var A = [4,5,6]
   # A = A.__init__(3,2,6)
    var  fit:  DynamicVector[Float64]  = init_fit()#// A list of 5 integers
    var python_array = PythonObject([])
    for i in range(len(fit)):
       python_array.append(fit[i])

   # print(A)
    # var fit = ListLiteral.__init__(fit2)
    Python.add_to_path("/home/kap/Desktop/MOJO_ALG_EVO")
    let printa_arr = Python.import_module("printar_array")
    printa_arr.printa_array(python_array,TAM_POP)
