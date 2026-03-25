class Person {
    #empno;
    name;
    age;

    constructor(empno, name, age) {
        this.#empno = empno;
        this.name = name;
        this.age = age;
    }

    display = () => {
        console.log(this.#empno, this.name, this.age);
    }

    setEmpNo = (empno) => {
        this.#empno = empno;
    }

    getEmpNO = () => {
        return this.#empno;
    }
}

let hong = new Person('1234', '홍길동', 30);
hong.display();
console.log(hong.name);
console.log(hong.age);
console.log(hong.empno);

// hong.empno = '4567';
hong.setEmpNo('4567');
hong.display();
console.log(hong.getEmpNO());