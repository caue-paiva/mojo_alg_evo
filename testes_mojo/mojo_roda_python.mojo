from python import Python

"""fn roda_evo() raises:
   #  Python.add_to_path("/home/kap/Desktop/MOJO_ALG_EVO")
     let AG = Python.import_module("algoritmo_evolutivo_basico_02")
     AG.main()"""
     

fn main() raises:
   Python.add_to_path("/home/kap/Desktop/MOJO_ALG_EVO")
   let AG = Python.import_module("algoritmo_evolutivo_basico_02")
   var tmnc = [ 1,2,3,4]
   AG.main()