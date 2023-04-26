# ながのCAKE

# 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

# 擁護の定義
|  用語  |  意味  |
| ---- | ---- |
|  顧客  |  ながのCAKEの商品を購入する人（客）  |
|  会員  |  ECサイトにユーザ登録している顧客  |
|  ECサイト  |  顧客が利用するサイト  |
|  管理サイト  |  店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）  |
|  注文ステータス  |  注文の状態遷移を表す。  |
|  製作ステータス  |  注文に紐付く注文商品の状態遷移を表す。  |
|  販売ステータス  |  商品の販売状況を表す。現状、販売中、売切れの2パターンがある。<br>販売停止商品は「売切れ」をセットする。  |
|  会員ステータス  |  現状、有効・退会の2パターンがある。  |
|  ジャンル  |  商品の種類。<br>現状、ケーキ、プリン、焼き菓子、キャンディの4ジャンルある。  |
|  注文個数  |  1回の注文に紐付く注文個数の合計。<br>例）商品Aを3個、商品Bを2個注文→注文個数は5。  |
|  商品小計  |  商品単価（税込）×個数<br>例）1,200円（税込）の商品を2個購入＝商品小計は2,400円  |

# 会員側実装機能
- 顧客は会員登録、ログイン・ログアウト、退会ができること
- 会員のログインはメールアドレスとパスワードで行うこと
- 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できるようにすること
- サイトの閲覧はログインなしで行えること
- 商品をカートに入れ、1度に複数種類、複数商品の購入ができること。また、カート内の商品は個数変更・削除ができること
- カートへの商品追加はログインなしでは行えないこと
- クレジットカード情報はシステム上保持しないこと
- 会員は配送先を複数登録しておくことが可能であること
- 会員はマイページから下記が行えること
  - ユーザ情報の閲覧・編集
  - 注文履歴の閲覧
  - 配送先の閲覧・編集
- 注文履歴一覧には下記の情報が表示されること
  - 注文日
  - 配送先
  - 支払金額（商品合計＋送料）
  - 注文ステータス
- 注文履歴詳細には下記の情報が表示されること
  - 注文日
  - 配送先
  - 支払方法
  - 注文ステータス
  - 商品の注文内容詳細（商品名、単価、個数、小計）
  - 請求情報（商品合計、送料、支払金額）
- 会員登録時、下記の情報をユーザ情報として入力できること
  - 名前（姓・名）
  - 名前（カナ姓・カナ名）
  - 郵便番号
  - 住所
  - 電話番号
  - メールアドレス
  - パスワード
- 商品は税込価格で表示されること
- ジャンルごとに商品が表示できること

# 管理者側(店側)実装機能
- 管理者用メールアドレスとパスワードでログインできること
- 商品について、下記が行えること
  - 新規追加、編集、閲覧
  - 販売停止（売切表示）
- 商品情報は下記のものを持つこと
  - 商品名
  - 商品説明文
  - ジャンル
  - 税抜価格
  - 商品画像
  - 販売ステータス
- 会員登録されているユーザ情報の閲覧、編集、退会処理が行えること
- ユーザの注文履歴が一覧・詳細表示でき、下記の情報が表示されること
【注文履歴一覧】
  - 購入日時
  - 購入者
  - 注文個数
  - 注文ステータス
【注文履歴詳細】
  - 購入者
  - 注文日
  - 配送先
  - 支払方法
  - 料金（商品合計、送料、請求金額合計）
  - 注文ステータス
  - 各注文商品詳細（商品名、単価(税込)、数量、小計）
  - 各注文商品の製作ステータス
  - 注文ごとに注文ステータスの更新、注文商品ごとに製作ステータスの更新ができること