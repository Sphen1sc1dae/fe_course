console.log(add(1,2));
console.log(add(1,2,3));

// function add(n1, n2) {
//     return n1 + n2;
// }

// function add(n1, n2, n3) {
//     return n1 + n2 + n3;
// }

// function add(n1, n2, n3, n4) {
//     return n1 + n2 + n3 + n4;
// }

function add(...args) { // -> Rest Parameter
    // return args.length;
    // let sum = args.reduce((sum, currentValue) => {
    //     return sum + currentValue
    // }); -> '{ }' 블럭 구간을 가시화시킨다면 반드시 구문내에 return 있어야 한다.
    let sum = args.reduce((sum, currentValue) =>
        sum + currentValue
    ); // -> 엔진 내부에서 자체적으로 return 을 생략 처리 시켜준다.

    return sum;
}

console.log(add2('Gile', 20, 1, 2, 3, 4, 5));

function add2(name, age, ...args) {
    let sum = 0;
    for(i = 0; i < args.length; i++) {
        sum += args[i];
    }
    // let sum = args.reduce((acc, cur) => acc + cur); -> reduce() 사용하여 표현할 수도 있다.
    return {
        name : name,
        age : age,
        score : sum
    }
};