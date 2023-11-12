from python import Python

def plot()-> PythonObject:

   let plt = Python.import_module("matplotlib.pyplot")
   let fig = plt.figure()
   Python.add_to_path("/home/kap/Desktop/MOJO_ALG_EVO")
   let animation = Python.import_module("create_pillow")
   let np = Python.import_module("numpy")
   animation.make_pillow(15,fig)
   

   return plt

fn main() raises:
   
  # plot()
    


  
  






   """Try:
    let np = Python.import_module("numpy")
   except:
      print("Numpy not installed")."""