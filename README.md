# [自販機問題](http://devtesting.jp/tddbc/?TDDBC%E5%A4%A7%E9%98%AA3.0%2F%E8%AA%B2%E9%A1%8C)

## SETUP
(注意) テストを行う場合は[MinitstReporter](https://github.com/kern/minitest-reporters)をインストールして
おいてください。
``` 
 gem install minitest-reporters
```


```
 $ git clone git@github.com:TakayaSugiyama/vending_machine.git
 $ cd  ~/vending_machine
 $ irb
 
 irbやpryの状態で以下のようにしてファイルを読み込んでください。これ以降の処理はirbやpryの状態で進みます。

 require "./lib/vending_machine" 
```

## STEP0.  お金の投入と払い戻し

- 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
- 投入は複数回できる。

```
  vm = VendingMachine.new 

  MoneyModule::MONEY.each do |money|
    vm.slot_money money
  end
```
  - 投入金額の総計を取得できる。

``` 
  vm.having_money   
```
 - 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。

 ``` 
   vm.return_money
 ``` 

 ## STEP1.   扱えないお金

 - 想定外のもの（硬貨：１円玉、５円玉。お札：千円札以外のお札）が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。

 ```
  [1,5,10000].each do |money|
    vm.slot_money  money
  end
 ```

 ## STEP2.  ジュースの管理
 
 - 値段と名前の属性からなるジュースを１種類格納できる。初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
 - 格納されているジュースの情報（値段と名前と在庫）を取得できる。

 ``` 
   vm.drinks 
 ```

 ## STEP3.  購入

 - ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
 - 払い戻し操作では現在の投入金額からジュース購入金額を引いた釣り銭を出力する。
 - 投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない。

``` 
  vm.slot_money 500
  vm.purchase("コーラ")    =>  {:釣り銭=> 380, :購入商品=>"コーラ"}
  vm.purchase("コーラ")    =>  {:釣り銭=> 0}
```  
 
 - 現在の売上金額を取得できる。 
 ```
  vm.sales
 ```


 ## STEP4  機能拡張

- ジュースを3種類管理できるようにする
  - 在庫にレッドブル（値段:200円、名前”レッドブル”）5本を追加する。
  - 在庫に水（値段:100円、名前”水”）5本を追加する。

``` 
  vm.add_drink("レッドブル",5)
  vm.add_drink("水",5)
  vm.drinks    => 追加を確認できる
``` 

- 投入金額、在庫の点で購入可能なドリンクのリストを取得できる。 

```
  vm.slot_money 100
  vm.purchasable_drink_list      => ["水"]
  vm.slot_money 100 
  vm.purchasable_drink_list      => ["コーラ","水", "レッドブル"]
```

## STEP5  釣り銭と売り上げ管理

確認済み



## テストの方法

```
$ ruby  test/テストファイル名.rb
```
上記のコマンドを打つとテストが走ります。

## ruby バージョン
ruby 2.6.5  









