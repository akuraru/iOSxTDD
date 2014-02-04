KiwiのSpecsについての簡単な解説です。これは、最新情報では無いかもしれません。細かいことについては、公式を見ることをおすすめします。

### 参考

https://github.com/allending/Kiwi/wiki/Specs
http://ynumerator.blogspot.jp/2012/09/ioskiwi.html

### describeとcontext

コンテキストを区切るための機能です。状態やテストの依存関係を明確にするために用います。describeとcontextの違いはありません。英語の意味やプロジェクトごとに使い分け方を決めておいたほうがいいかもしれません。

``` objc
describe(@"FizzBuzz", ^{
    context(@"A", {
        let(variable, ^{ return @"A"; });
    });
    context(@"B", {
        let(variable, ^{ return @"B"; });
    });
});
```

### beforeAll, afterAll, beforeEach, afterEach

テスト実行前に各コンテキスト内の事前条件の設定や解除を行うための機能です。Allは、コンテキスト内で一度だけ行われる処理。Eachと書かれているものはテストごとに行われる処理です。

``` objc
context(@"A", ^{
    beforeEach(^{
        // Aのコンテキスト内に3つのテストがあるので3回実行される
    });
    context(@"B", ^{
        afterAll(^{
            // 記述する位置は特に制限は無いが何らかの規則性があったほうがいいだろう
        });
        beforeAll(^{
            // test 1とtest 2の前に一度だけ実行される
        });
        it(@"test 1", ^{ });
        it(@"test 2", ^{ });
    });
    context(@"C", ^{
        it(@"test 3", ^{ });
    });
});
```

### it

テストを実行するための機能です。例示し、オブジェクトが実際に期待通りに動くことをしめします。

### pending_

テストを保留中しておくための機能です。ここに記述しても実行はされません。

### その他

まだ、いくつかの機能はありますが、主要なところは以上です。詳しくは公式wikiを見ることをおすすめします。