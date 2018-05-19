#### 1. Element, Node, HTMLElement, EventTarget 类型关系
> Basically EventTarget is the most general type, of which Element is a subtype, and HTMLElement is a subtype of that. If you get back a thing from the DOM, we generally have no idea which it is, and you should add a type assertion to "add in" the specific external knowledge that you have about the structure of your particular DOM layout.

是说EventTarget是最基础的类型，Element是其的子类型，HTMLElement是Element的子类型。在不确定类型的时候，可以使用类型断言(有点类似类型转换，将父类型转换成子类型，才可以调用子类型上的方法)

案例: 
1. HTMLElement是EventTarget的子类型, 在将event.target传入类型为HTMLElement的函数时候，需要将event.target通过类型断言转换为
HTMLElement。否则报错(`argument of type 'EventTarget' is not assignable to parameter of type 'HTMLElement'`)
```js
{
    isControlEle(dom: HTMLElement) {}
    listenControlEle() {
        document.addEventListener('click', (e) => {
            const targetDom = e.target;
            this.isControlEle(targetDom as HTMLElement)
        });
    }
}
```
2. react 某个state通过接口定义了其拥有哪些属性及其类型时候，但是初始化是空值，需要通过类型断言进行类型转换，否则报错
```js
interface IA {
    xxx: string,
};
interface IState = {
    a: IA,
}
constructor() {
    state: IState = {
        a: {} as IA,
    };
}
```
