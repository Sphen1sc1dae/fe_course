function add(a, b) {
    return a + b;
}

const add2 = (a, b) => {return a + b;}

const add3 = function(a, b) {
    return a + b;
}

const numbers = [1, 2, 3, 4, 5];
let sum = numbers.reduce((acc, cur) => acc + cur);

console.log(`add = ${add(1, 2)}`);
console.log(`add2 = ${add(1, 2)}`);
console.log(`add3 = ${add(1, 2)}`);
console.log(`sum = ${sum}`);