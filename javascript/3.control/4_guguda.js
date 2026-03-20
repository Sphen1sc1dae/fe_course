/**
 * 구구단 : 2단 출력
 *  2 * 1 = 2
 *  ..
 *  2 * 9 = 18 
 */

//임의의 단을 입력받아 출력
let dan = undefined;
dan = 5;
for(let i=1; i<10; i++) {
    console.log(`${dan} * ${i} = ${dan*i}`);    
}