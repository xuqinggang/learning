### keyof operator. it queries the set of keys for a given type

```javascript
interface Todo {
  id: number;
  text: string;
  due: Date;
}
// We can apply the keyof operator to the Todo type to get back a type representing all its property keys, which is a union of string literal types:

type TodoKeys = keyof Todo; // "id" | "text" | "due"
```

举例：查看Object.entries方法在lib.es2017.object.d.ts中的类型声明
interface ObjectConstructor {
  // ...
  entries<T extends { [key: string]: any }, K extends keyof T>(o: T): [keyof T, T[K]][];
  // ...
}

### 参考文献
[TypeScript 2.1: keyof and Lookup Types](https://blog.mariusschulz.com/2017/01/06/typescript-2-1-keyof-and-lookup-types)
