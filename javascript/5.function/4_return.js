/**
 * return : 함수 실행 결과를 반환 키워드
 * 반환 결과가 1개 값 -> 변수
 * 반환 결과가 1개 이상 값 -> 객체
 */
function add1() {
    // console.log(`sum = ${1 + 2}`);
    return 1+2;
}

// add1(); 
console.log(add1());
let result = add1();
console.log(result);

//name, age를 입력받아, 객체를 리턴하는 함수 생성 및 호출
function createObj(name, age) {
    return {
        name: name,
        age: age
    }
}

let hong = createObj('홍길동', 30);
let lee = createObj('이순신', 40);
console.log(hong.name, hong.age);
console.log(lee.name, lee.age);

//홍길동, 이순신, 김유신 객체를 배열에 저장 출력
let objList = [
    createObj('홍길동', 30),
    createObj('이순신', 40),
    createObj('김유신', 50),
];
console.log(objList);

for(i=0; i<objList.length; i++) {
    let obj = objList[i];
    console.log(`name = ${obj.name}`);
    console.log(`age = ${obj.age}`);    
}