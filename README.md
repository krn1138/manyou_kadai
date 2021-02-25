# README

# Ruby 2.6.3

|モデル | カラム | データ型 |
| :--- | :---: | ---: |
| Task | name | text |
|      | note | string |
|      | user_id | bigint |


|モデル | カラム | データ型 |
| :--- | :---: | ---: |
| User | name | text |
|      | email | bigint |
|      |password| string|

|モデル | カラム | データ型 |
| :--- | :---: | ---: |
| labeling | task_id | bigint |
|      | label_id | bigint |

|モデル | カラム | データ型 |
| :--- | :---: | ---: |
| label | name | text |

# Heroku　デプロイ方法

# 1 アセットプリコンパイルをする
# 2 コミットする
# 3 Herokuに新しいアプリケーションを作成
# 4 Heroku stackを変更
# 5 Heroku buildpackを追加
# 6 Herokuにデプロイ

#　使用しているGemバージョン　2.1.4