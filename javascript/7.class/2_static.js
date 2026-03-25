class Fruit {
    static MAX_SIZE = 10;
    name; color; emoji;

    constructor(name, color, emoji) {
        this.name = name;
        this.color = color;
        this.emoji = emoji;
    }

    static getName = () => {
        return this.name;
    }
    getName = () => {
        return this.name;
    }
    
    static create = (name, color, emoji) => {
        return new Fruit(name, color, emoji);
    }
}

let apple = new Fruit('apple', 'red', '🍎');
console.log(apple);
console.log(Fruit.getName());
console.log(apple.getName());

let lemon = Fruit.create('lemon', 'yellow', '🍋');
console.log(lemon);
console.log(lemon.getName());