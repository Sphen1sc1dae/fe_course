/**
 * iterable object를 순회하여 값을 가져옴
 * - for(const(let) 변수 of 순회객체) { 실행문; }
 */

/* 배열의 요소를 치환하는 함수 생성 : for..of */
function replace(array, oldItem, newItem) {
    let arrayCopy = Array.from(array);

    let idx = 0;
    for(const item of arrayCopy) {
        if(item == oldItem) {
            arrayCopy.splice(idx, 1, newItem);
        }
        idx++;
    }
    return arrayCopy;
}

// forEach
function replace1(array, oldItem, newItem) {
    let arrayCopy = Array.from(array);

    arrayCopy.forEach((item,idx) => {
        if(item === oldItem) arrayCopy.splice(idx, 1, newItem);
    })
    return arrayCopy;
}

// map
function replace2(array, oldItem, newItem) {
    // let arrayCopy = Array.from(array);
    return array.map(item => (item === oldItem) ? itme = newItem : item);
}

function replaceObj(array, oldItem, newItem) {
    let arrayCopy = Array.from(array);

    let idx = 0;
    for(const item of arrayCopy) {
        if(item.emojis == oldItem) {
            arrayCopy.splice(idx, 1, {name: item.name, emojis: newItem});
        }
        idx++;
    }
    return arrayCopy;
}

let fruits = ['🍊', '🍎', '🍋', '🍏', '🍌'];
let fruitsObj = [
    {name : 'orange', emojis : '🍊'},
    {name : 'lemon', emojis : '🍋'}
];

let obj1 = replace(fruits, '🍊', '🍏');
let obj2 = replaceObj(fruitsObj, '🍋', '🍏');
let obj1_1 = replace1(fruits, '🍊', '🍏');
let obj1_2 = replace2(fruits, '🍊', '🍏');

console.log(fruits);
console.log(obj1);
console.log(obj1_1);
console.log(obj1_2);
console.log();
console.log(fruitsObj);
console.log(obj2);