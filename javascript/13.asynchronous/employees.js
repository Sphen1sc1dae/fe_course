// 최초 호출되는 이벤트 함수 : window.addEventListener()
window.addEventListener('DOMContentLoaded', () => {
    show();
});

// getJson 함수 생성
const data_url = 'http://127.0.0.1:5501/javascript/13.asynchronous/employees.json'

const getJson = async () => {
    let response = await fetch(data_url);
    return response.json();
}
// async function getJson() { -> 표현식 차이
//     let response = await fetch(data_url);
//     return response.json();
// }

// show 함수 생성
const show = async() => {
    let jsonData = await getJson();
    console.log('jsonData =>', jsonData, typeof jsonData);

    let output = `
        <h1>${jsonData.title}</h1>
        <table border=1>
            <tr>
                <th>Num.</th>
                <th>Name</th>
                <th>Age</th>
                <th>Department</th>
            </tr>
            ${  // JS 코드
                jsonData.list.map((person, idex) =>
                    `<tr>
                        <td>${idex + 1}</td>
                        <td>${person.name}</td>
                        <td>${person.age}</td>
                        <td>${person.department}</td>
                    </tr>`
                ).join("")
            }
        </table>
    `;

    // console.log(output);
    document.querySelector('#content').innerHTML = output;
}

// show();