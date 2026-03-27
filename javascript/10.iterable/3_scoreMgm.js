
function createList() {
    return new Array();
}
function createScore(scoreList, name, kor, eng, math) {
    scoreList.push({name, kor, eng, math});
}
function search(scoreList, name) {
    return scoreList.find(score => score.name === name);
}
function searchScore(scoreList, sub, score) {
    return scoreList.filter(itme => itme[sub] >= score); // -> 매개변수로 받았으므로 [] 괄호 사용. 점 연산자(.) 사용하고 싶으면 item.kor 처럼 원래 이름으로 받아와야 됨.
}

let scoreList = createList();
createScore(scoreList, 'hong', 98, 99, 100);
createScore(scoreList, 'smith', 77, 99, 100);
createScore(scoreList, 'Lee', 98, 96, 100);
createScore(scoreList, 'James', 89, 97, 98);
console.log(scoreList.length);

// 제임스 검색
console.log(search(scoreList, 'James'));
// 국어 점수가 90점 이상인 학생 검색
console.log(`searchScore :: `, searchScore(scoreList, 'kor', 90));
// 영어 점수가 98점 이상인 학생 검색
console.log(`searchScore :: `, searchScore(scoreList, 'eng', 98));
// 모든 학생의 수학점수 +5