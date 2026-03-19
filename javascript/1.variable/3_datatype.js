console.log(2**31);
let inumber = 2**31 -1;
let inumber2 = 2**31;
console.log(inumber, inumber2);

let fnumber = Math.PI;
console.log(fnumber);

let name = 'Lee';
let cname = 'Lee';
console.log(name);
console.log(cname);

let flag = true;
console.log(flag);

let nameArray = ['Lee', 'Kim', 'Park'];
console.log(nameArray);

let obj = {
    "name": 'Lee',
    "age": '25'
}
console.log(obj);

let jsonObj = {
    "name": "Lee",
    "score": [100, 99, 98]
};
console.log(jsonObj);

let x = undefined; // Primitive(기본형) 초기화
let xy = null; // Reference 초기화

let xx = 10;
let xxx = 20;
let yy = '10';
let oo = {'name': 'object'};
console.log(xx, typeof xx);
console.log(yy, typeof yy);
console.log(oo, typeof oo);

console.log(typeof xx == typeof xxx);
console.log(typeof xx == typeof yy);
console.log(xx === yy);
console.log(xx == yy);