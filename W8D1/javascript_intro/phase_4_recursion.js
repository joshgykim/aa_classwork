function range(start, end) {
    if (start === end) {
        return [end];
    }

    return [start].concat(range(start+1, end));
}

// console.log(range(0,10));
// console.log(range(0,0));

function sumRec(arr) {
    if (arr.length === 1) {
        return arr[0];
    }

    return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([1,2,3,4]));
// console.log(sumRec([1,2,3,4,5]));
// console.log(sumRec([1]));

function exponent(base, exp) {
    if (exp === 0) {
        return 1;
    }
    return base * exponent(base, exp-1);
}

console.log(exponent(2, 2));
console.log(exponent(2, 3));
console.log(exponent(2, 4));
console.log(exponent(2, 5));
console.log(exponent(2, 6));
console.log(exponent(2, 0));

function exponent2(base, exp) {
    if (exp === 0) {
        return 1;
    } else if (exp === 1) {
        return base;
    }

    if (exp % 2 === 0) {
        let half = exp / 2;
        return exponent(exponent2(base, half), 2);
    } else {
        let math = (exp-1)/2;
        let expResult = exponent(base, math);
        return base * exponent(expResult, 2);
    }
}

console.log(exponent2(2, 2));
console.log(exponent2(2, 3));
console.log(exponent2(2, 4));
console.log(exponent2(2, 5));
console.log(exponent2(2, 6));
console.log(exponent2(2, 0));
