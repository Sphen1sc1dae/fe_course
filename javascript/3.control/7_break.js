/**
 * 반복문을 강제 종료하는 방법
 * - break : break를 만나면 바로 종료
 * - 조건식 : false 조건으로 만듬, break보다 한번 더 조건을 체크!!
 */

// 1~10까지 반복
// i=7 이면 종료 - break
for(let i=1; i<=10; i++) {
    console.log(`i = ${i}`);
    if(i===7) break;  //for문 바로 종료    
}
console.log();
// i=7 이면 종료 - 조건식을 false로 만들기
for(let i=1; i<=10; i++) {
    console.log(`i = ${i}`);
    if(i===7) i=11;  
}
