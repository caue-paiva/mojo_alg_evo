from python import Python

def main():
    try:
        var res = Python.import_module("matplotlib.pyplot")
        res.plot([1.1,2.2,4.4])
        res.show()
    except e:
        print(e)