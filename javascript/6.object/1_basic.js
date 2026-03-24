/**
 * object : 
 * - {}, 다양한 데이터 타입을 저장
 * - object literal, { property(key) : value } 
 * - JSON(JavaScript Object Notation)에서는 property(key)를 반드시 문자열로 정의
 */

// 학생의 성적을 관리하는 객체 생성, Object Literal
const hong = {
    n : '홍길동',
    age : 30
}

console.log(hong);
console.log(hong.n);
console.log(hong.age);

hong.n = 'Cole';
hong.age = 20;
console.log(hong);
console.log(`hong = ${hong}`);

delete hong.n;
delete hong.age;
console.log(hong);