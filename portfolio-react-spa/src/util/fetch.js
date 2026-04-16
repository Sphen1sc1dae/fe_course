/**
 * 네트웍을 이용하여 JSON 데이터 가져오기
 */
export const fetchData = async(url) => {
    const response = await fetch(url);
    return response.json();
}