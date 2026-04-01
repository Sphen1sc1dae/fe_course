const key = `a2d42a55f4de4e19f9d16c2b6686c398`;
// let targetDT = `20260331`;

const getJson = async(type, targetDT) => {
    const data_url = `https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/search${type}BoxOfficeList.json?key=${key}&targetDt=${targetDT}`
    // console.log(data_url);
    let response = await fetch(data_url);
    return response.json();
}

const getMovieInfo = async(movieCd) => {
    let info_url = `https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=${key}&movieCd=${movieCd}`
    let response = await fetch(info_url);
    return response.json();
}

const openModal = (infoObj) => {
    let modal = document.querySelector('#modal');
    let modalBody = document.querySelector('#modal-body');
    let modalClose = document.querySelector('#modal-close');

    modalClose.addEventListener('click', () => {
        modal.style.display = 'none';
        modalBody.innerHTML = '';
    })

    let output = `
        <h3>[${infoObj.rank}]${infoObj.movieNm}</h3>
        <ul>
            <li><label>🎥감독 : </lable> ${infoObj.director}</li>
            <li><label>🍿배우 : </lable> ${infoObj.actors}</li>
        </ul>
    `;
    modal.style.display = 'flex';
    modalBody.innerHTML = output;
}

const handleMovieInfo = async(movieCd, rank) => {
    // console.log('영화 상세 정보', movieCd);
    let info = await getMovieInfo(movieCd);
    let movieNm = info.movieInfoResult.movieInfo.movieNm;
    let director = info.movieInfoResult.movieInfo.directors[0].peopleNm;
    let actors = info.movieInfoResult.movieInfo.actors[0].peopleNm;
    
    console.log(info, movieNm, director, actors);
    openModal({movieNm, director, actors, rank});
}

const handleBoxOffice = async() => {
    let sdate = document.querySelector('#sdate').value;
    let type = document.querySelector('#type').value.charAt(0).toUpperCase() + document.querySelector('#type').value.slice(1);

    if(type === 'default') {
        alert('Please Select Type');
        document.querySelector('#type').focus();
    } else if(sdate === '') {
        alert('Please Select a Date');
        document.querySelector('#sdate').focus();
    } else {
        // let dateArray = new String(sdate).split("-");
        // // targetDT = dateArray[0] + dateArray[1] + dateArray[2];
        targetDT = sdate.split("-").reduce((acc,cur) => acc + cur);
        let kobis = await getJson(type, targetDT);
        let kobisResult = kobis.boxOfficeResult;
        let kobisBoxofficeList = null;
        if(type === 'Daily') {
            kobisBoxofficeList = kobis.boxOfficeResult.dailyBoxOfficeList;
        } else {
            kobisBoxofficeList = kobis.boxOfficeResult.weeklyBoxOfficeList;
        }
        // console.log(sdate, typeof sdate);
        // console.log(targetDT);
        console.log(kobis);

        let output = `
            <h1>${kobisResult.boxofficeType}</h1>
            <h3>${kobisResult.showRange}</h3>
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
                    kobisBoxofficeList.map(status =>
                        `<tr>
                            <td>${status.rank}</td>
                            <td><a href="#" onclick = "handleMovieInfo(${status.movieCd}, ${status.rank})">${status.movieNm}</a></td>
                            <td>${status.openDt}</td>
                            <td>${parseInt(status.audiCnt).toLocaleString()} 명</td>
                            <td>${parseInt(status.audiAcc).toLocaleString()} 명</td>
                            <td>${parseInt(status.salesAcc).toLocaleString()} 원</td>
                        </tr>`
                    ).join("")
                }
            </table>
        `;

        document.querySelector('#content').innerHTML = output;
    }
}