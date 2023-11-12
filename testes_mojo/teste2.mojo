

fn change_vector(inout vector: DynamicVector[Float64]):
    vector[0] = 19

fn main():
    var vector: DynamicVector[Float64] = DynamicVector[Float64](10)
    vector.push_back(10)

    change_vector(vector)

    print(vector[0])
