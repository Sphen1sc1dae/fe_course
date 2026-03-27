/**
 * 배열의 모든 요소를 순회하면서, 콜백함수의 조건을 적용하여, 새로운 배열 생성 후 반환
 * - 배열객체.map(callback)
 */
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let fnumbers = [1.123, 2.345, 3.2545];

let result = numbers.map(number => number * 100);
console.log(result);

let result2 = fnumbers.map(fnumber => Math.floor(fnumber));
console.log(result2);