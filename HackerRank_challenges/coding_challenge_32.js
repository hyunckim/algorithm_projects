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

function getMaxMonsters(n, hit, t, h) {

  if (t === 0) {
    return h.filter((el) => {
      return el <= 0;
    }).length;
  }
  return getMaxMonsters(n, hit, t-1, h);
}
