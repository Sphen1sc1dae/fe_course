class Animal {
    constructor(name, emoji) {
        this.name = name;
        this.emoji = emoji;
    }
    display = () => console.log(this.name, this.emoji);
    sleep = () => console.log(`${this.name}(${this.emoji}) 가 잠을 자요 ~`);
}

class Dog extends Animal {
    constructor(name, emoji, color) {
        super(name, emoji); // -> 부모의 생성자 호출, 생성된 name, emoji는 자식에 반환
        this.color = color;
    }
    // display, sleep 함수 주소 참조
}

class Poodle extends Dog {
    constructor(name, emoji, color, food) {
        super(name, emoji, color); // -> super()는 반드시 생성자 내부 최상단에 위치해야 하며 단 하나만 존재할 수 있다.
        this.food = food;
    }
    sleep = () => console.log(`Poodle:: ${this.name}(${this.emoji}) 가 잠을 자요 ~`);
}

let animal = new Animal('animal', '😊');
console.log(animal);
animal.display();
animal.sleep();

let dog = new Dog('happy', '🐕', 'brown');
console.log(dog);
dog.display();
dog.sleep();

let dog2 = new Poodle('해피', '🐕', 'brown', '사료');
console.log(dog2);
dog2.display();
dog2.sleep();