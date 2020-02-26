##问题
1. typescript 函数（对象）上如何支持添加静态属性，支持类型验证？
+ **通过namespace**
[Declaration Merging](https://www.typescriptlang.org/docs/handbook/declaration-merging.html)
[TypeScript - Namespace? Module?](https://blog.higan.me/namespace-and-module-in-typescript/)
```sh
export namespace Object {
  export let test: number;
};
Object.test = 123;
```

+ 利用interface?
[描述混合类型](https://nodelover.gitbook.io/typescript/jie-kou-yu-lei)
```sh
混合类型通常出现在第三方 js 库的 d.ts 文件上面，在我们写d.ts文件的时候可能需要。
interface Counter {
    (start: number): string;
    interval: number;
    reset(): void;
}
function getCounter(): Counter {
    let counter = <Counter>function (start: number) {console.log('start is ' + start)};
    counter.interval = 123;
    counter.reset = function () {console.log('do you want reset counter?')};
    return counter;
}
let c = getCounter();
c(10);
c.reset();
c.interval = 5.0;
console.dir(c)
```
Counter 描述的是一个函数，并且它有静态的interval属性，和静态的reset方法。
getCounter 就是一个工厂函数，每次访问他，都可以得到一个被Counter接口修饰的函数。
并且我们通过tsc -d生成一下我们的d.ts文件。
```sh
interface Counter {
    (start: number): string;
    interval: number;
    reset(): void;
}
declare function getCounter(): Counter;
declare let c: Counter;
```
##资料
[typescript已经有模块系统了，为什么还需要namespace？](https://www.zhihu.com/question/65676593)
