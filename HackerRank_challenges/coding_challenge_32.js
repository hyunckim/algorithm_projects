function duplication(x){
    let binary = "0";

    while (binary.length < 1000) {
        binary = a(binary);
    }
    return binary[x];
}

function a(binary) {
    let t ="";
    for (let i =0; i < binary.length; i++) {
        if (binary[i] == 1) {
            t += "0";
        } else { t += "1"; }
    }

    return binary + t;
}
