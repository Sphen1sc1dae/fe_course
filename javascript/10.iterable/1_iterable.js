/**
 * Iterable(순회) Object : Iteration Protocol을 준수하는 객체
 * - for .. of 구문
 * - String, Array, Set, Map
 * - ...(Spread Operator: 스프레드 연산자, 전개구문) : 블록안에서 객체의 데이터를 전개함(펼쳐놓음)
 * - ...(Rest Parameter) : 매개변수 모든 값을 배열로 저장
 * - ...(Destructring Object: 구조분해 할당) : 객체를 분해한 후 변수에 할당
 */
let strList = new String('Hello~ JavaScript!!');
for(let str of strList) {
    console.log(str);
}

// let numbers = new Number(12345);
// console.clear();
// for(let number of numbers) {
//     console.log(number);
// }

// Array 객체 생성 후 for..of 사용
console.clear();

let numbers = [1, 2, 3, 4, 5];
for(let number of numbers) {
    console.log(number);
}

// forEach()
numbers.forEach(number => console.log(`number = ${number}`));
// find() - 3, findIndex() - 3의 인덱스 주소
let findNumber = numbers.find(number => number === 3);
let findIndex = numbers.findIndex(number => number === 3);
console.log();
console.log(`find = ${findNumber}`);
console.log(`findIdx = ${findIndex}`);

console.log();
// filter() - 짝수만 반환
let evenNumbers = numbers.filter(number => !(number%2));
let oddNumbers = numbers.filter(number => (number%2));
console.log(evenNumbers);
console.log(oddNumbers);

// map() - 모든 요소에 + 10
let result = numbers.map(number => number + 10);
console.log(result);