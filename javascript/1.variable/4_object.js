let apple = null;
apple = {
    // 'price': 1000,
    // 'from': 'Seoul',
    // 'emoji': '🍎'
    // 아래와 같이도 가능하지만, 확장성과 명확성을 위해서 ' ' 표시 써 주는것이 좋다.
    price: 1000,
    from: 'Seoul',
    emogi: '🍎'
}
console.log(typeof apple, apple);
console.log(apple);
console.log(apple.emoji);

let orange = {
    'name': 'orange',
    'color': 'orange',
    price: 1000,
    emogi: '🍊'
}
console.log(typeof orange, orange);

let fruitList = null;
fruitList = ['apple', '🍎', 1000, 1990, true, 'orange'];
// 당연하겠지만 이따구로 쓰면 좋은 코드라 할 수 없다. 데이터 형식을 일관성 있게 유지해 주자.
console.log(fruitList);
console.log(fruitList[2]);
console.log(fruitList.length);

let fruitListObj = null;
fruitListObj = [apple, orange];
console.log(fruitListObj);
console.log(fruitListObj[0].emogi);
console.log(fruitListObj[1].emogi);