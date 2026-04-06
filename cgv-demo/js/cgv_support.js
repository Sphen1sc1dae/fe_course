/**
 * DOM 객체 생성후 객체 호출
 */
window.addEventListener('DOMContentLoaded', () => {
    // 검색하기 버튼 이벤트
    let search_content = document.querySelector('#search_content');
    let btnSearch = document.querySelector('#btnSearch');

    btnSearch.addEventListener('click', () => {
        if(search_content.value.trim() === '') {
            alert('검색할 내용을 입력해 주세요');
            search_content.focus();
        } else {
            // 검색 진행

        }
    })

    filterMenu('all'); // 맨 처음 호출되는 테이블

    let menuList = document.querySelectorAll('.filter-menu li a');
    menuList.forEach(menu => {
        menuList.forEach(menu => menu.id === 'all'? 
            menuSelectColor(menu) : menuDefaultColor(menu));
            
        menu.addEventListener('click', () => {
            menuList.forEach(menu => menuDefaultColor(menu));
            menuSelectColor(menu);
            filterMenu(menu.id);
        });
    });

}) // window event

function menuDefaultColor(menu) {
    menu.style.background = "rgb(137,137,135)";
    menu.style.borderLeft = `1px solid var(rgb(137,137,135))`;
    menu.style.borderBottom = `2px solid var(rgb(137,137,135))`;
}

function menuSelectColor(menu) {
    menu.style.background = "rgb(251, 67, 87)";
    menu.style.borderLeft = `1px solid var(rgb(251, 67, 87))`;
    menu.style.borderBottom = `2px solid var(rgb(251, 67, 87))`;
}

// filterMenu 함수를 생성
async function filterMenu(type) {
    console.log(type);
    let filterList = null;
    if(type === 'all') {
        // createTable();
        filterList = await getJson();
    } else {
        filterList = await filterData(type);
    }
    // return filterList;
    createTable(filterList);
}

// filterData 함수 생성
async function filterData(type) {
    let data = await getJson();
    // console.log('data => ', data);
    return data.filter(item => item.type === type);
}

async function getJson() {
    let response = await fetch("../data/support.json");
    return response.json();
}

async function createTable(list) {
    // 1. 검색 건수 동적 업데이트 (추가된 로직)
    // #before-table 아이디를 가진 요소의 텍스트를 데이터 길이에 맞춰 변경합니다.
    const countElement = document.querySelector('#before-table');
    if (countElement) {
        countElement.textContent = `총 ${list.length}건이 검색되었습니다.`;
    }
    let output = `
        <table id = 'stable'>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>구분</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                ${
                    list.map((item, idx) => `
                        <tr>
                            <td>${idx+1}</td>
                            <td>${item.type}</td>
                            <td>${item.title}</td>
                            <td>${item.rdate}</td>
                            <td>${item.hits}</td>
                        </tr>
                    `).join("")
                }
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5">1 2 3 4 5  >></td>
                </tr>
            </tfoot>
        </table>
    `;

    document.querySelector('#stable')?.remove();
    document.querySelector('#before-table').insertAdjacentHTML('afterEnd', output);
}