/* call by reference : 데이터 중복 사용시 주소 복제
-> 값이 Heap 에 저장되어 있는 경우
*/

let name = 'Gile';
let name2 = name; // call by reference
let name3 = new String('Gile');
let name4 = name3; // call by reference

console.log(name, typeof name);
console.log(name2, typeof name2);
console.log(name3, typeof name3);
console.log(name === name2);
console.log(name === name3);
console.log(name3 === name4);

// - - - - - - - - - - - - - -

let nlist = [1, 2, 3, 4, 5];
let nlist2 = nlist; // call by reference

let person = {
    name: 'Gile',
    age: 30
}
let person2 = person; // call by reference
console.log(nlist, typeof nlist);
console.log(nlist2, typeof nlist2);
console.log(nlist == nlist2);
console.log(nlist[2] === nlist2[2]);
console.log(person, typeof person);
console.log(person2, typeof person2);
console.log(person === person2);
console.log(person.name === person2.name);

person2.name = 'Lee';
console.log(person.name);
console.log(person.name === person2.name);
console.log(person);