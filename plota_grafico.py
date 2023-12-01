import matplotlib.pyplot as plt

def plot_simple_graph(y_values, x_max ):
    #print(f"x max {x_max}")
    #print(f"tamanho do array y {y_values}")
    x_values = list(range(x_max))
    plt.plot(x_values, y_values)
    plt.title("fitness sobre geracoes")
    plt.xlabel("geracoes")
    plt.ylabel("Fitness")
    plt.show()