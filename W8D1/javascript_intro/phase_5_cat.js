function Cat(owner, name) {
    this.owner = owner;
    this.name = name;
}

Cat.prototype.cuteStatement = function() {
    console.log(`${this.owner} loves ${this.name}`);    
}

Cat.prototype.meow = function() {
    console.log("Meow");
}

const garfield = new Cat("John", "Garfield");
const kitty = new Cat("Mary", "Kitty");

garfield.cuteStatement();

Cat.prototype.cuteStatement = function() {
    console.log(`Everyone loves ${this.name}`);
}

garfield.cuteStatement();
garfield.meow();

garfield.meow = function() {
    console.log("Bark");
}
garfield.meow();

kitty.meow();