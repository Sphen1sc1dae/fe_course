/**
 * 호이스팅(hoisting) - 파일이 호출되면 실행 전 function 키워드의 함수들을 객체로 미리
 *                    메모리에 생성하는 작업
 */

//test1, test2 함수는 호이스팅 되므로 호출 시 정상 실행!!
test1();  //호이스팅 ⭕
test2();  //호이스팅 ⭕

function test1() {
    console.log(`---> test1`);    
}

function test2() {
    console.log(`---> test2`);    
}

//ES6 기준의 키워드 let, const로 정의된 함수는 호이스팅 되지 않음!!
//반드시 함수 실행 후 호출 되어야 함!!

// test3();  //ReferenceError, 호이스팅 ❌
// test4();  //ReferenceError, 호이스팅 ❌

const test3 = () => {
    console.log(`---> test3`);
}

let test4 = function() {
    console.log(`---> test4`);    
}

test3();
test4();