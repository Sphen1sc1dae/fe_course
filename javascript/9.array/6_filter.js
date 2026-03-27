/**
 * 배열객체에서 필터링을 진행한 후 Shallow Copy(얕은 복사) 진행 후 리턴
 * - 배열객체.filter(callback)
 */
let strList = ['hong', 'smith', 'lee', 'james'];
let fruits = [
    {name : 'apple', emojis : '🍎'},
    {name : 'orange', emojis : '🍊'},
    {name : 'lemon', emojis : '🍋'},
    {name : 'apple', emojis : '🍎'},
    {name : 'orange', emojis : '🍊'},
    {name : 'lemon', emojis : '🍋'},
]

let filterObj = strList.filter(str => str.length > 4);
console.log(filterObj);
console.log(`filterObj = ${filterObj}`);

let lemons = fruits.filter(fruit => fruit.name === 'lemon');
let lemonsFind = fruits.find(fruit => fruit.name === 'lemon');
console.log();
console.log(lemons);
console.log(lemonsFind);
console.log(lemons[0].name, lemons[0].emojis);
console.log(lemonsFind.name, lemonsFind.emojis);