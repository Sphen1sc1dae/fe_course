let fr = [
    {n: 'apple', em: '🍎'},
    {n: 'orange', em: '🍊'},
    {n: 'lemon', em: '🍋'}
];
let frC = structuredClone(fr);
// console.log(fr, typeof fr);
// console.log(frC, typeof frC);

fr[0].em = '🍏';
frC[2].n = 'good';
console.log(fr, typeof fr);
// console.log(frC, typeof frC);

let frC2 = JSON.parse(JSON.stringify(frC));
frC2[1].n = 'JSON';
console.log(frC, typeof fr);
console.log(frC2, typeof frC);