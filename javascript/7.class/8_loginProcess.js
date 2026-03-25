class User {
    #id;
    #password;

    constructor(id, password) {
        this.#id = id;
        this.#password = password;
    }

    getId = () => this.#id;
    getPassword = () => this.#password;

    setId = (id) => this.#id = id;
    setPassword = (password) => this.#password = password;

}

function loginCheck() {
    let id = document.querySelector('#id').value;
    let password = document.querySelector('#pwd').value;
    // console.log(id, password);

    // 유효성 체크(Validation check) - 데이터의 유,무 확인
    if(id === '') {
        alert('Please Enter ID')
        document.querySelector('#id').focus();
    } else if(password === '') {
        alert('Please Enter PWD')
        document.querySelector('#pwd').focus();
    } else {
        let user = new User(id, password);
        let userObj = { id, password };
        console.log(user);
        console.log(userObj);
    }

    if(user.getId() === 'test' && user.getPassword() === '1234') {
        alert('로그인 성공 !')
    } else {
        alert('아이디 혹은 패스워드가 일치하지 않습니다.')
    }
}