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

// console.log(exponent(2, 2));
// console.log(exponent(2, 3));
// console.log(exponent(2, 4));
// console.log(exponent(2, 5));
// console.log(exponent(2, 6));
// console.log(exponent(2, 0));

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

// console.log(exponent2(2, 2));
// console.log(exponent2(2, 3));
// console.log(exponent2(2, 4));
// console.log(exponent2(2, 5));
// console.log(exponent2(2, 6));
// console.log(exponent2(2, 0));

function fibonacci(n){
    if (n === 1){    
        return [1]; 
    }
    else if (n === 2){
        return [1, 1]; 
    }

    let lastFibonacci = fibonacci(n-1);
    return lastFibonacci.concat(lastFibonacci[lastFibonacci.length-1] + lastFibonacci[lastFibonacci.length-2]);
}

// console.log(fibonacci(3));
// console.log(fibonacci(4));
// console.log(fibonacci(5));
// console.log(fibonacci(6));

function deepDup(arr){
    if (!(arr instanceof Array)) {
        return arr; 
    }
    let returnArr = [];

    for(let i = 0; i < arr.length; i++) {
        returnArr.push(deepDup(arr[i]));
    }
    return returnArr;
}

// let e = [7,8,9];
// let b = [4,e,6];
// let a = [1,b,3];
// let d = a;
// let c = console.log(deepDup(a));
// console.log(a===c);
// console.log(a===d);

function bsearch(arr, target) {
    if (arr.length === 0){
        return -1;
    }

    let midPoint = Math.floor(arr.length / 2); 
    let left = arr.slice(0, midPoint); 
    let right = arr.slice(midPoint+1);

    if (arr[midPoint] === target){
        return midPoint;
    }else if (arr[midPoint] > target) {
        return bsearch(left, target);
    }else {
        return midPoint + bsearch(right, target) + 1;
    }

    return -1;
}

// let a = [1,2,3,4,5,6,7,8,9,10];
// console.log(bsearch(a, 3));
// console.log(bsearch(a, 4));
// console.log(bsearch(a, 5));
// console.log(bsearch(a, 10));

function mergeSort(arr) {
    if (arr.length <= 1) {
        return arr; 
    }

    let midPoint = Math.floor(arr.length/2); 
    let leftSorted = mergeSort(arr.slice(0, midPoint)); 
    let rightSorted = mergeSort(arr.slice(midPoint)); 

    return merge(leftSorted, rightSorted);
}

function merge(left, right){
    let merged = []; 

    while (left.length !== 0 && right.length !== 0) {
        if (left[0] > right[0]){
            merged.push(right.shift()); 
        }else {
            merged.push(left.shift());
        }
    }

    return merged.concat(left).concat(right); 
}

// let a = [10,2,-1,5,3,7,2,5,1,2,15];
// let b = [2,1];
// console.log(mergeSort(a));

function subsets(arr){
    if (arr.length === 0) { 
        return [[]];
    } 

    let arrSub = []; 
    let arrWithoutFirst = arr.slice(1);
    let arrWithoutFirstSub = subsets(arrWithoutFirst);

    for (let i = 0; i < arrWithoutFirstSub.length; i++){
        arrSub.push(arrWithoutFirstSub[i]);
        arrSub.push([arr[0]].concat(arrWithoutFirstSub[i]));
    }
    return arrSub;
}

let a = ['a', 'b'];
console.log(subsets(a));