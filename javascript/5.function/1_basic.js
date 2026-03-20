let list = [1, 2, 3, 4, 5];

// 일반적인 함수 정의. stack frame 생성되는 함수
function test() { 
    console.log('test !');
}

/* 화살표 함수(Arrow function) 정의.
형태 : const 함수명 = (파라미터) => {...}
*/
const arrow_test = () => {
    console.log('test !');
}

/* JS 엔진 내부에는 빌트인 함수(내장 함수)가 포함되어 있다 -> parseInt(), parseDouble() ...
함수 호출 : 함수명(파라미터);
*/
let str = '100';
let str2 = '100.1234';
let n = parseInt(str);
let n2 = parseFloat(str2);

console.log(str, typeof str);
console.log(str2, typeof str2);
console.log(n, typeof n);
console.log(n2, typeof n2);

// 일반 함수 선언
function sum() {
    console.log(10 + 20);
}

// 화살표 함수 선언
const arrow = () => {
    console.log(`arrow = ${10 + 20}`);
}

sum();
arrow();