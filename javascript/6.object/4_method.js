/**
 * 객체를 생성하는 함수 : 생성자 함수(Constructor Function)
 * 객체의 메소드 정의 : 객체안에 함수형식으로 정의
 */
const fruit = {
    name : 'apple',
    emojis : '🍎',

    getName : function() {return this.name;},
    getEmo : function() {return this.emojis;},
    display: function() { console.log(this.name, this.emojis); },
    // -> return { this.name, this.emojis } 사용은 불가능하다. 해당 방식은 property 로 정의되지 않기 때문.
    // -> function() { return { this.name, this.emojis }} 해당 구조에서 fruit() 내부에 braces 통해 한 번더 영역이 생겨 this 사용 불가.
    display2 : function() { return {name: this.name, emojis: this.emojis} }
    // -> return 을 사용하고자 한다면 이런 형식으로 나타내야 한다.
}
console.log(fruit);
console.log(fruit.name);
console.log(fruit.emojis);
console.log(fruit.getName());
console.log(fruit.getEmo());
console.log(fruit.display());
console.log(fruit.display2());