Array.prototype.myEach = function(callBack){
    this.forEach( el => { 
        callBack(el);    
    });
}

function doubler(el){
    return el*2;
}

//[1,2,3,4,5].myEach(doubler);

Array.prototype.myMap = function(callBack) { 
    let returnArr = []; 

    this.myEach( el => {
        returnArr.push(callBack(el));
    });
    return returnArr;
}

//console.log([1,2,3,4,5].myMap(doubler));

Array.prototype.myReduce = function(callBack, initial = 0){

    if (initial === 0) {
        var accumulated = this[0];  
        var arr = this.slice(1, this.length);
    }else{ 
        var accumulated = initial;
        var arr = this; 
    }

    arr.myEach(num => {
        accumulated = callBack(accumulated, num);
    });
    
    return accumulated;
}

// console.log([1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
//   })); // => 6


// // with initialValue
// console.log([1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
//   }, 25)); // => 31