from matrix import matriz


fn main():
    var ma1 = matriz(Float64(5.0),2,2)

    ma1.imprime_matriz()

    var ma2 = matriz(Float64(7.0),2,2)

    ma2.imprime_matriz()

    var ma3 = ma1 + ma2

    ma3.imprime_matriz()