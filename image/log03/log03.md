今回はBDD系のフレームワークであるKiwiの導入と簡単なコードの説明をしていこうと思います。

### Kiwiの概要

BDD（振る舞い駆動開発）を支援するためのフレームワークです。要求仕様に近い形でテストコードを記述することが出来ます。

https://github.com/allending/Kiwi

要するにXCTestでは書きづらいテストが多くあるので、書きやすくするフレームワークを使いましょうということです。

他にもテストを支援するフレームワークは多く存在するので調べてみてください。

### Kiwiをターゲットに追加

Kiwi追加する方法はCocoaPodsを使うのが一般的でしょう。下記のようにPodfileにtargetを指定してKiwiを追加します。targetを指定しない場合、全てのターゲットに対して追加されてしまいます。テスト関連のフレームワークにはプライベートAPIを使っているものがあり、それが組み込まれていることでAppleからアプリがリジェクトされてしまうことがあります。
ここではKiwiを追加するにあたり、"Kiwi/XCTest"を指定しています。これは単に"Kiwi"を指定するとSenTestKit用のKiwiが追加されてしまうからです。

``` ruby
target "iOSxTDD" do
  pod 'Kiwi/XCTest'
end
```

あとは、`pod install`で実際にターゲットに追加します。

### テストファイルを作る

FizzBuzzSpec.mというファイルを作って、テスト実行するための基板のコードを書きます。SPEC_BEGINにはクラス名を入れます。ここではファイルと同じFizzBuzzSpecを指定しています。

```
#import "Kiwi.h"

SPEC_BEGIN(FizzBuzzSpec)
// ここにテストを書いていく
SPEC_END
```
### テストを失敗させる

まずはテスト自体が動いていることを確認するためにテストを失敗させます。itの中がテストとして実行されます。

```
it(@"test test", ^{
    fail(@"test failure");
});
```

### テストを移行する

前にXCTestで書いたテストをKiwiに書き直します。describeやcontextによってスコープや状態を切り分けるのに使います。変数に__blockをつけることによって変数を変更できるようになります。beforeAllは各コンテキスト内の全てのテストの前に一度掛け実行されます。他に各テストの前に実行されるbeforeEachやテストの後に実行されるafterAllなどがあります。

```
context(@"FizzBuzz", ^{
    __block FizzBuzz *fizzBuzz;
    beforeAll(^{
        fizzBuzz = [[FizzBuzz alloc] init];
    });
    it(@"1", ^{
        [[[fizzBuzz at:1] should] equal:@"1"];
    });
});
```

### 残りのテストを移行する

1のテストとほぼ同じなので省略します。
