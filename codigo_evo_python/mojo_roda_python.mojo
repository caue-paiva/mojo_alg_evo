from python import Python

def roda_evo():
    Python.add_to_path("/home/kap/Desktop/MOJO_ALG_EVO/codigo_evo_python")
    let AG = Python.import_module("algoritmo_evolutivo_basico_02")
    AG.main()

fn main() raises:
   roda_evo()