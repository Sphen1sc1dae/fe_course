import { setValue, getValue, updateValue, deleteValue } from '../commons/object.js'

const person = {
    n : "Lee",
    age : 20
}

const apple = {
    n : "apple"
}

setValue(person, 'address', '서울시 강남구');
setValue(person, 'job', 'SW 엔지니어');
setValue(apple, 'emj', '🍎');
console.log(person);
console.log(apple);

console.log(getValue(person, 'n'));
// let na = getValue(person, 'n');
// console.log(na);

console.log();
console.log(person);
console.log(apple);

updateValue(apple, 'emj', '🍏');
console.log(apple);

deleteValue(person, 'job');
console.log(person);