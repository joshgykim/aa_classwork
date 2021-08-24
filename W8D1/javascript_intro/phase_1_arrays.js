Array.prototype.uniq = function() {
    let uniqArr = [];
    this.forEach(num => {
        if (!uniqArr.includes(num)) {
        uniqArr.push(num);
        }
    });
    return uniqArr;
};


console.log([1,2,2,3,3,3].uniq()); // => [1,2,3]

Array.prototype.twoSum = function() {
    let pairArr = [];
    
    for (let i = 0; i < this.length; i++) {
        for (let j = i; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                pairArr.push([i, j]);
            }
        }
    }
    return pairArr;
};

console.log([1,-1,2,-3,-2,3].twoSum());

Array.prototype.transpose = function () {
    let nestArr = [];

    for (let row = 0; row < this.length; row++) {
        let tempArr = [];
        for (let col = 0; col < this[row].length; col++) {
            tempArr.push(this[col][row]);
        }
        nestArr.push(tempArr);
    }

    return nestArr;
}

arr1 = [[1,2,3],
        [4,5,6],
        [7,8,9]]
    
// ==>    [[1,4,7],
//         [2,5,8],
//         [3,6,9]]

console.log(arr1.transpose())