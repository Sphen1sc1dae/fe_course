let dataList = [
    { name: '홍길동', age: 20, address: '서울시', emoji: '🧑'},
    { name: '김철수', age: 21, address: '부산시', emoji: '🧑'},
    { name: '박영희', age: 22, address: '서울시', emoji: '👩'},
    { name: '박정민', age: 23, address: '인천시', emoji: '🧑'},
    { name: '홍길순', age: 24, address: '서울시', emoji: '👩'},
];

class Student {
    #name;
    #age;
    #address;

    constructor(name, age, address, emoji) {
        this.#name = name;
        this.#age = age;
        this.#address = address;
        this.emoji = emoji;
    }

    getName = () => this.#name;
    getAge = () => this.#age;
    getAddress = () => this.#address;
    getEmoji = () => this.emoji;

    setName = (name) => this.#name = name;
    setAge = (age) => this.#age = age;
    setAddress = (address) => this.#address = address;
    setEmoji = (emoji) => this.emoji = emoji;

    display = () => console.log(this.#name, this.#age, this.#address, this.emoji);
}

const studentList = [];
for(let i=0; i<dataList.length; i++) {
    let obj = dataList[i];
    let student = new Student(obj.name, obj.age, obj.address, obj.emoji);
    studentList.push(student);
}

console.log(studentList);

console.log('------- 학생 리스트 -------- ')
for(let i=0; i<studentList.length; i++) {
    let student = studentList[i];
    console.log(student.getName() + '\t', student.getAge() + '\t', student.getAddress() + '\t', student.getEmoji());
}
console.log('----------------------------')