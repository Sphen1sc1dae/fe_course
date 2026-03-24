import {
    getObjects,
    createObject,
    deleteObject,
    getObject,
    setValue,
    getValue,
    updateValue,
    deleteValue
} from '../commons/object.js'

// import * as object from '../commons/object.js';
// -> 전체를 import 하여 사용. 이 경우, object 라는 이름으로 묶음. => object.getObjects() 이런 형태로 모든 함수 사용해야 함.

// 주소록 생성
let addressBook = getObjects(); //objects 주소 공유
createObject('hong');

let hong = getObject('hong');

// hong 객체에 속성값 추가
setValue(hong, 'name', '홍길동');
setValue(hong, 'age', '32');
setValue(hong, 'address', '서울시 강남구');

console.log(getValue(hong, 'name'));
console.log(getValue(hong, 'age'));
console.log(getValue(hong, 'address'));

updateValue(hong, 'address', '부산시');
console.log(getValue(hong, 'address'));

deleteValue(hong, 'address');

deleteObject('hong');

console.log(addressBook);