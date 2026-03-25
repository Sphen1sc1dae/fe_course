// class(클래스)란? 객체를 생성하기 위한 설계도(툴) -> 객체지향언어의 클래스와는 다르다.
// JS에서는 내부적으로 프로토타입 기반의 형식으로 실행된다.

class Animal {
    // -> class 의 field 에서는 변수, 상수를 static 으로 정의. 클래스 상수, 상수로 부름.
    static MAX_SIZE = 10; 
    /* -> 상수는 객체 생성 전 별도의 메모리에 저장됨.
    (static) 생략하고 MAX_SIZE = 10 선언시 log 출력창에 [] 만 출력됨. */
    static className = 'Animal';

    // consturctor = 생성자
    constructor(name, emoji) {
        this.name = name;
        this.emoji = emoji;
    }

    display = () => {
        console.log(this.name, this.emoji);
        // -> this.name 은 따로 정의하지 않아도 클래스 이름을 찾는 객체.
    }
}

let dog = new Animal('happy', '🐕');

console.log(dog);
console.log(dog.name);
console.log(dog.emoji);
console.log(typeof dog);
dog.display();
console.log(`Class Name : ${Animal.className}`);
console.log(`Animal.MAX_SIZE = ${Animal.MAX_SIZE}`);