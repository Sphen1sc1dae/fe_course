let a = 10;
console.log(a);

{
    let b = 20;
    console.log(a, b);
    {
        let c = 30;
        console.log(a, b, c);
    }
}   // 지역 스코프 : Locla block scope

// 전역 스코프 : Global block space