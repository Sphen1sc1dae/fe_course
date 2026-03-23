/**
 * 함수 생성 및 호출
 */
import { toNumber } from "../commons/utils.js";

//호출 가능
add('100', 200);
add(300, 400);
add(1234, 23485);

//두 수를 입력하여, 합계를 출력
//호이스팅(hoisting)되어 add함수 호출 전 메모리에 저장 됨
function add(num1, num2) {  //num1, num2는 add 블록에서만 존재하는 지역변수로 선언
    // let n1 = parseInt(num1);
    // let n2 = parseInt(num2);
    let obj = toNumber(num1, num2);   //{ num1: parseInt(num1), num2: parseInt(num2)}
    console.log(`sum = ${obj.num1 + obj.num2}`);    
}

//add2 함수는 호이스팅이 되지 않으므로, 에러발생
// add2(100, 200);
// add2(200, 400);

//arrow function(화살표 함수)
//호이스팅 되지 않으므로, 반드시 선언한 후에 호출되어야 함
const add2 = (num1, num2) => {
    // let n1 = parseInt(num1);
    // let n2 = parseInt(num2);
    let obj = toNumber(num1, num2);
    console.log(`sum2 = ${obj.num1 + obj.num2}`);    
}
console.log();
add2(100, 200);
add2('200', '400');