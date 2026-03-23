export function singleGugudan(dan) {
    const title = `
    **********************
    ${dan}단
    **********************`;
    console.log(title);
    
    for(let i = 1; i <= 9; i++) {
        console.log(`${dan} X ${i} = ${dan * i}`);
    }
}

export function multiGugudan(dan1, dan2) {
    const title = `
    **********************
    ${dan1}단 ~ ${dan2}단
    **********************`;
    console.log(title);

    for(let j = dan1; j <= dan2; j++) {
        let rows = ' ';
        for(let i = 1; i <= 9; i++) {
            console.log(`${j} X ${i} = ${j * i}\t`);
        }
        console.log(rows);
    }
}
// let j = dan1; j <= dan2; j++
// let i = 1; i <= 9; i++