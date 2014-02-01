簡単なところでFizzBuzzのテストを書いていこうと思います。

#### クラスの追加

まずは、FizzBuzzというクラスを追加します。今回はこのクラスに対してテストを行います。

#### テスト対象の追加

今回のテスト対象を追加します。このメソッドに対して0以上の程度の数まで動作を確かめるテストを書いていこうと思います。

```
@interface FizzBuzz : NSObject
- (NSString *)at:(NSInteger)n;
@end
```

実装については適当に空文字を返しておきます。

```
- (NSString *)at:(NSInteger)n {
    return @"";
}
```

#### テストを書く

テストを書いていきます。まずは1を入れて、文字列の1が返ってくることを確かめるテストです。

```
- (void)test1 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:1];
    XCTAssertEqualObjects(result, @"1", @"1を送ると文字列の1を返す");
}
```

ここでは、XCTestを使っているので、XCTAssertEqualObjectsを使っています。SenTextKitを使っている場合は、STAssertEqualObjectsを使います。このアサートは、一つ目の引数と二つ目の引数がisEqual:でtrueを返すときにテストが通ります。三つ目の引数以降はテストが失敗したときのヒントとなります。
このまま実行すると実装のほうが空文字を返しているので、テストが失敗します。

#### テストを通す

とりあえず、先ほど書いたテストが通るように書いてみます。

```
- (NSString *)at:(NSInteger)n {
    return @"1";
}
```

明らかに意図通りでは無いコードですが、テストは通ります。はじめからいと通りのコードがかけるのであれば、そのほうがいいと思います。

#### テストを追加する

不安がなくなるまで、テストを増やします。

```
- (void)test3 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:3];
    XCTAssertEqualObjects(result, @"Fizz", @"3を送ると文字列のFizzを返す");
}

- (void)test5 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:5];
    XCTAssertEqualObjects(result, @"Buzz", @"5を送ると文字列のBuzzを返す");
}

- (void)test15 {
    FizzBuzz *fizzBuzz = [[FizzBuzz alloc] init];
    NSString *result = [fizzBuzz at:15];
    XCTAssertEqualObjects(result, @"FizzBuzz", @"15を送ると文字列のFizzBuzzを返す");
}
```

どう見てもコピペですがとりあえず気にしない。ここでは3,5,15だけですが不安ならもっと多くてもいいです。3つも一気に増やす必要もありません。

#### テスト、実装を繰り返す

残りの実装やテストについては省略します。どのくらい繰り返すかは、テスト関連の書籍やブログを読みましょう。
