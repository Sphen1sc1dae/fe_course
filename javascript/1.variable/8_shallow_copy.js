// 1. 객체의 요소가 원시 데이터인 경우
let fr = [ 'apple', 'orange', 'lemon'];
let frC = Array.from(fr);
console.log(fr, typeof fr);
console.log(frC, typeof frC);

frC[0] = 'Mango'
fr[0] = '🍎'
console.log(fr, typeof fr);
console.log(frC, typeof frC);

// 2. 객체의 요소가 참조 데이터인 경우
let frO = [
    {n: 'apple', em: '🍎'},
    {n: 'orange', em: '🍊'},
    {n: 'lemon', em: '🍋'}
];
let frCO = Array.from(frO);

console.log(frO, typeof frO);
console.log(frCO, typeof frCO);

frO[0].em = '😊'
console.log(frO, typeof frO);
console.log(frCO, typeof frCO);