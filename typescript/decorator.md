## typescript装饰器，与bable实现的装饰器有差别
typescript装饰器 文档（https://www.typescriptlang.org/docs/handbook/decorators.html）
babel装饰器文档（https://github.com/loganfsmyth/babel-plugin-transform-decorators-legacy）

### 与装饰器相关的函数
1. Object.defineProperty
params: {
target: 直接作用的对象
propertyKey: 属性键
descriptor: 属性描述符
}
> [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty)

2. Object.getOwnPropertyDescriptor
方法返回指定对象上一个自有属性对应的属性描述符。（自有属性指的是直接赋予该对象的属性，不需要从原型链上进行查找的属性）
> [https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor)


相对装饰器来说
举例实现对箭头函数的装饰(https://stackoverflow.com/questions/49928260/typescript-decorators-not-working-with-arrow-functions)
```javascript
class Maths {
    test = 123;

    @log
    add = (a, b) => {
        console.log(this.test, 'this.test')
        return a + b;
    }
}
//target 原型对象
function log(target, name) {
    let patchedFn, fn;
    /* 若此时获取Object.getOwnPropertyDescriptor(target, name), 因为add是class fileds(Class fields are just assigned to this in constructor.) (class field because it doesn't exist on class prototype)
    所以获取到的是undefined
    */ 
    // target是Maths.prototype
    Object.defineProperty(target, name, {
        configurable: true,
        enumerable: false,
        get() {
            if (!patchedFn) {
                patchedFn = (...args) => {
                    console.log(args)
                    return fn.apply(this, args);
                }
            }
            return patchedFn;
        },
        set(newFn) {
            console.log(newFn, 'set')
            patchedFn = undefined;
            fn = newFn;
        }
    });
}
```
