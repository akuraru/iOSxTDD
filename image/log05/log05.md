例示を用いてオブジェクトの動作を確認していく仕組みについてです。これはマッチャー式を用いて記述されます。

### shouldとshouldNot

` [subject should] `と` [subject shouldNot] `を用いて期待する動作になるかをテストします。subjectがnil出会った場合でも問題なくテストは動作します。ただし、あまりにもnilであることが自明な場合コンパイルエラーになります。


### equal:

同値判定をする場合に用います。他にもの継承クラスでことの判定などのメソッドが用意されています。

```
[[subject should] equal:(id)anObject]
[[subject should] beKindOfClass:(Class)aClass]
[[subject should] beMemberOfClass:(Class)aClass]
[[subject should] conformToProtocol:(Protocol *)aProtocol]
[[subject should] respondToSelector:(SEL)aSelector]
```

### beNil

nilであることをテストするために用います。通常Objective-Cでnilに対してメッセージを送った場合、何も行われません。Kiwiでは不思議な力で解決しています。

```
[[subject should] beNil];
```


### theValue(aScalar)

Kiwiでテストはテストする対象はオブジェクトでなくてはいけません。プリミティブ型をテストするためには、`theValue(aScalar)`マクロを用います。この機能は`stub`の値がプリミティブ型であるときにも用います。

```
[[theValue(1 + 1) should] equal:theValue(2)];
```

数値の判定にはいくつかメッソドがあり`beLessThan:`などがあります。

### コレクション

コレクションのためのいくつかのメソッドが用意されています。

```
[[subject should] beEmpty];
[[subject should] contain:(id)anObject];
[[subject should] containObjectsInArray:(NSArray *)anArray];
[[subject should] containObjects:(id)firstObject, ...];
[[subject should] haveCountOf:(NSUInteger)aCount];
[[subject should] haveCountOfAtLeast:(NSUInteger)aCount];
[[subject should] haveCountOfAtMost:(NSUInteger)aCount];
```

### 相互作用とメッセージ

特定のメッセージが呼ばれることを期待するテストを書くための機能です。必要に応じて`andReturn:(id)aValue`を指定することによって`stub`としての機能も果たすことができます。

```
[[subject should] receive:(SEL)aSelector];
[[subject should] receive:(SEL)aSelector andReturn:(id)aValue];
```

### Custom Matchers

他にも独自にマッチャーを作ることができます。詳しくはwiki’を参照してください。

