/* ES6 기준의 문법형식 적용
변수 : 데이터를 저장하는 공간 
변수 선언 키워드 : var, let, const
var의 경우 선언한 변수가 중복될 수 있으므로 권장 X */

// let number = 100;
// number = 'hello';
// let number = 200;
// console.log(number);

const number2 = 100;
// number2 = 'hello';
console.log(number2);

let name = '홍길동';
let name2 = '홍길동';
console.log('name = ', name,'name2 = ', name2);

// number 변수에 정수 100을 저장
let number = 100;
console.log('number = ', number);

// DB 연동시 비동기식 처리(프로그램 실행 가장 마지막에 실행)

// flag 변수에 true 값 저장
let flag = true;
console.log(flag);

// cname 변수에 상수로 '이순신' 저장
const cname = '이순신';
console.log(cname);