# Rubyによるデザインパターン

**Rubyによるデザインパターン (著: ラス・オルセン）**という本のサンプル集です。

この本は、Gofの23のデザインパターンの14個をカバーしています。

* [テンプレートメソッド](#template-method)
* [Strategy](#strategy)
* [Observer](#observer)
* [Composite](#composite)
* [Iterator](#iterator)
* [Commands](#commands)
* [Adapter](#adapter)
* [Proxy](#proxy)
* [Decorator](#decorator)
* [Singleton](#singleton)
* [Factory](#factory)
* [Builder](#builder)
* [Interpreter](#interpreter)


----------------------------------------------------------------

## デザインパターン

### テンプレートメソッド<a name="template-method"></a>

目的/概要:
  * アルゴリズムに多様性をもたせたい場合に便利
  * 基底クラスに不変の部分を記述し、変わる部分はサブクラスに定義するメソッドにカプセル化する

やり方:
  1. アルゴリズム間で骨格となるメソッド(**テンプレートメソッド**)を定義した**基底クラス**を作成する
     基底クラスのテンプレートメソッドは、サブクラスのために標準実装をしておくか、raiseなどでサブクラスにオーバーライドを促すようにする。
  2. それぞれのアルゴリズムごとに**テンプレートメソッド**をオーバーライドした**サブクラス**を作成する

実例:
  * WEBrick
  * initializeメソッド - 初期化の最後にinitializeを呼び出すようにしている

