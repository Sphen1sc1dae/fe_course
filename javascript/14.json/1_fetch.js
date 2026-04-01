let key = `a2d42a55f4de4e19f9d16c2b6686c398`;
let targetDT = `20260331`;
const data_url = `https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=${key}&targetDt=${targetDT}`

const getJason = async() => {
    // console.log(data_url);
    let response = await fetch(data_url);
    return response.json();
} // 비동기

const show = async() => {
    // 1. JSON 데이터 가져오기
    let kobis = await getJason();
    console.log(kobis);

    // 2. 출력 데이터 생성 : DHTML
    let output = `
        <h1>${kobis.boxOfficeResult.boxofficeType}</h1>
        <h3>Date : ${kobis.boxOfficeResult.showRange}</h3>
        <table border=1>
            <tr>
                <th>순위</th>
                <th>영화제목</th>
                <th>개봉일</th>
                <th>당일관객수</th>
                <th>누적관객수</th>
                <th>누적매출액</th>
            </tr>
            ${  // JS 코드
                kobis.boxOfficeResult.dailyBoxOfficeList.map(status =>
                    `<tr>
                        <td>${status.rank}</td>
                        <td>${status.movieNm}</td>
                        <td>${status.openDt}</td>
                        <td>${status.audiCnt}</td>
                        <td>${status.audiAcc}</td>
                        <td>${status.salesAcc}</td>
                    </tr>`
                ).join("")
            }
        </table>
    `;

    // 3. 출력
    document.querySelector('#content').innerHTML = output;
}

window.addEventListener('DOMContentLoaded', () => {
    show();
})