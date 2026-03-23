const job = (a, b, callback) => {
    // console.log(a,b);
    callback(a, b);
}

const print = (a, b) => { console.log(a, b); }

const printSum = (a, b) => { console.log(a + b); }

// job(1, 2, (a, b) => { console.log(a, b)});
job(1, 2, print); // -> callback 함수로 print() 함수에 매개인자 전달
job(10, 20, (a, b) => { console.log(a + b)});

console.clear();
console.log('console에 로그 출력 1')

// setTimeout(()=> {}, 1000); 1초 후에 콜백함수 호출, 비동기식 처리 함수.
setTimeout(() => {
    console.log('setTimeout run');
}, 1000);

console.log('console log 출력 2')