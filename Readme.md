Convert Kakeibo(Android Application) CSV exports to QIF format (usable by GnuCash and others) 

・How to use
When you convert for the first time
	./k2gnucash.sh cashbook.csv

When you convert from the second time
	./k2gnucash_diff.sh (Old Cashbook.csv) (New Cashbook.csv)



このシェルは、アンドロイドの家計簿アプリ「かけ～ぼ」のCSV出力をGnucashで読み込み可能な
QIFファイルに変換します。

○データ変換の方法
1．すべて新規データの場合
	./k2gnucash.sh cashbook.csv

2．以前、「かけーぼ」からの変換を行っている場合
	./k2gnucash_diff.sh (旧Cashbook) (新Cashbook)
	注)前のCashbook.csvデータは日付とかをファイル名に入れてとっておくこと!


○Gnucashへのインポートの方法
基本的な支出先→支出元
基本的な収入元→金を入れるところ
	161203_0_収入_こづかい.qif	一時プール金→現金(財布)	#収入元は収入\その他の収入だったりする。
	161203_1_収入_こづかい.qif	普通預金	→一時プール金
	161203_1_支出_こづかい.qif	一次プール金→現金(財布)	#支出先は費用\家庭費や費用\財布だったりする。
	161203_0_支出_嗜好品.qif	現金(財布)	→費用:嗜好品
	161203_0_支出_通信費.qif	現金(財布)	→費用:通信費
	161203_0_支出_生活費.qif	現金(財布)	→費用:生活費
	161203_0_支出_食費.qif		現金(財布)	→費用:食費
	161203_0_支出_趣味・娯楽費.qif	現金(財布)	→費用:娯楽費
	161203_0_支出_交通費.qif	現金(財布)	→費用:交通費
	161203_0_支出_交際費.qif	現金(財布)	→費用:交際費
	161203_0_支出_教育費.qif	現金(財布)	→費用:教育費
