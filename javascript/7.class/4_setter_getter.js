class Employee {
    #empno;

    constructor(empno, name, age) {
        this.#empno = empno;
        this.name = name;
        this.age = age;
    }

    getEmpno = () => { return this.#empno; }
    getName = () => { return this.name; }
    getAge = () => { return this.age; }

    setEmpno = (empno) => { this.#empno = empno; }
    setName = (name) => { this.name = name; }
    setAge = (age) => { this.age = age; }

    display = () => { console.log(this.#empno, this.name, this.age); }
}

let hong = new Employee();
hong.setEmpno('1234')
// hong.empno = '4567'; -> empno 라는 변수가 새롭게 할당됨. 즉, empno , #empno 2개가 생김. 최신 엔진에서 패치된 듯.
hong.setName('Hong')
hong.setAge(30)
console.log(hong.getEmpno());
hong.display();

let smith = new Employee('9999', 'smitch', 27);
smith.display();

let empList = [];
// empList[0] = hong;
// empList[1] = smith;
empList.push(hong);
empList.push(smith);
console.log('empList.pop(hong) ::\n', empList.pop);
console.log(empList, typeof empList);

let empListObj = {};
empListObj['hong'] = hong;
empListObj['smith'] = smith;

console.log(empListObj);