Array.prototype.bubbleSort = function() {
    let notSorted = true;

    while (notSorted) {
        notSorted = false;
        for (let i = 0; i < this.length-1; i++) {
            if (this[i] > this[i+1]) {
                let temp = this[i+1];
                this[i+1] = this[i];
                this[i] = temp;

                notSorted = true;
            }
        }
    }
    return this;
}

console.log([1,3,5,7,2,4,6,8].bubbleSort());

String.prototype.substrings = function() {
    let subArr = [];

    for (let i = 0; i < this.length; i++) {
        subArr.push(this[i]);
        let temp = this[i];
        for (let j = i+1; j < this.length; j++) {
            subArr.push(temp += this[j]);
        }
    }

    return subArr;
}

console.log('abcd'.substrings());