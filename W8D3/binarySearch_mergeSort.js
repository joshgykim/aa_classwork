Array.prototype.myBinarySearch = function(target) {

  // use this.methodName 
  if (this.length === 0) {
  return -1;
  }  
  let midIndex = Math.floor(this.length/2);
  let left = this.slice(0, midIndex);
  let right = this.slice(midIndex + 1);  
  if (this[midIndex] === target) {
  return midIndex;
  } else if (this[midIndex] > target) {
      return left.myBinarySearch(target);
  } else {
      let result = right.myBinarySearch(target);
      return (result === -1 ? -1 : midIndex + 1 + right.myBinarySearch(target));
  }
}


function mergeSort(arr, callback) {

 // use arr.methodName

 if (arr.length <= 1) {
     return arr;
 }

 let midIndex = Math.floor(arr.length/2);
 let left = arr.slice(0, midIndex);
 let right = arr.slice(midIndex);
 let leftSorted = mergeSort(left, callback);
 let rightSorted = mergeSort(right, callback);

 return merge(leftSorted, rightSorted, callback);
}

function merge(arr1, arr2, callback) {
    let merged = [];

    while (arr1.length > 0 && arr2.length > 0) {
        if (callback(arr1[0], arr2[0])) {
            merged.push(arr2.shift());
        } else {
            merged.push(arr1.shift());
        }
    }

    return merged.concat(arr1.concat(arr2));
}

let callback = function(a, b) {
    if (a > b) {
        return true;
    } else {
        return false;
    }
}

