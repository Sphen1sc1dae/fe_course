/* call by value : 데이터 중복 사용시 값 복제
-> 값이 Stack 에 저장되어 있는 경우
*/

let number = 100;
let cnumber = number; // call by value

let flag = true;
let cflag = flag; // call by value

console.log(number, typeof number);
console.log(cnumber, typeof cnumber);
console.log(cnumber === cnumber);
console.log(cnumber === cnumber);
console.log();
console.log(flag, typeof flag);
console.log(cflag, typeof cflag);
console.log(flag === cflag);