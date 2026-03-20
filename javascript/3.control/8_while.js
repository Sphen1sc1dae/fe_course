/**
 * while - 종료되는 조건을 알고 있는 경우 사용
 * 
 * 초기값
 * while(조건식) {
 *      실행문;
 *      증가값;
 * }
 */

//1~10까지 출력
//7까지 출력 후 종료
let i = 1;
while(i <= 10) {
    console.log(`i = ${i}`); 
    if(i===7) break;
    i++;   
}

//메뉴 선택
//메뉴1:피자, 메뉴2:핫도그, 메뉴3=햄버거
let flag = true;
let menu = 1;
while(flag) {
    console.log(`1:피자, 2:핫도그, 3:햄버거`);
    if(menu === 1) {
        console.log(`🍕`);    
        flag = false;    
    } else if(menu === 2) {
        console.log(`🌭`);  
        flag = false;              
    } else if(menu ===3 ){
        console.log(`🍔`); 
        flag = false;              
    } else {
        console.log('메뉴 준비중~, 다른 메뉴를 선택해주세요.');        
        flag = false;
    }    
}