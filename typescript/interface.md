1. 使用TypeScript在现有原型上扩展实例
```sh
interface Object {
    GetFoo(): Foo;
}

Object.prototype.GetFoo = function() {
    return new Foo();
}
```
2. TypeScript interface implementing doesn't check method parameters
问题：
interface IConverter {
    convert(value: number): string
}

class Converter implements IConverter {
    convert(): string { // no error?
        return '';
    }
}
// 实现interface，无法检查interface中的函数参数

const v1: IConverter = new Converter();
const v2: Converter = new Converter();

v1.convert(); // error, convert has parameter, although Converter's convert doesn't expect one
v2.convert(); // ok, convert has no parameters, although Converter implements IConverter which should has paramater

> 总结:
大概是typescript的类型验证是基于结构类型的。允许函数参数少的 赋值给 多参数函数
> 参考链接
[Why are functions with fewer parameters assignable to functions that take more parameters?](https://github.com/Microsoft/TypeScript/wiki/FAQ#why-are-functions-with-fewer-parameters-assignable-to-functions-that-take-more-parameters)
[TypeScript interface implementing doesn't check method parameters](https://stackoverflow.com/questions/51727721/typescript-interface-implementing-doesnt-check-method-parameters)
[comparing-two-functions](https://www.typescriptlang.org/docs/handbook/type-compatibility.html#comparing-two-functions)
[类型兼容性](https://www.tslang.cn/docs/handbook/type-compatibility.html)
