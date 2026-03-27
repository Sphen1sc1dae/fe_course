/**
 * 배열의 누적합을 구하는 메소드
 * - 배열객체.reduce(callback)
 */ numbers = [1, 2, 3, 4, 5];
let sum = numbers.reduce((acc, cur) => acc + cur);
console.log(sum);

let max = numbers.reduce((acc, cur) => Math.max(acc, cur));
console.log(max);
let min = numbers.reduce((acc, cur) => Math.min(acc, cur));
console.log(min);