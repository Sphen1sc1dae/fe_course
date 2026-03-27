/**
 * find : 배열에서 검색하려는 첫번째 요소를 반환, 없으면 undefined 반환
 * - 배열객체.find(callback)
 * - 하나의 요소만 반환!!
 * 
 * findIndex : 배열에 검색하는 요소의 인덱스 반환
 * - 배열객체.findIndex(callback)
 */
let fruits = new Array('🍊', '🍎', '🍋', '🍏', '🍌');
let findObj = fruits.find((item) => (item === '🍏'));
console.log(`findObj = ${findObj}`);

let findIdx = fruits.findIndex((item) => (item === '🍏'));
console.log(`findIdx = ${findIdx}`);