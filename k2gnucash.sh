#!/usr/bin/bash
#1行目がタイトルの場合は飛ばす処理にした。
#
#(使用法)
#./k2gnucash.sh (対象Cashbook)
#(説明)
#かけ～ぼのCashbook.csvからGnucashのQIFファイルへのデータ変換を行う。

datename="`date +%y%m%d`"
#echo $datename

cat $1 | iconv -f sjis -t utf-8 | sed -e 's/"//g' -e '/^日付/d' | awk -F '[,]' -v "dateA=$datename" '
{
	if ($3 == "支出")
			print "D" $1 "\n" "T" $4 "\n" "cx\n" "P" $5 "\n" "L財布\n" "^" >> dateA "_" $6 "_" $3 "_" $2 ".qif"
	else if ($3 == "収入")
			print "D" $1 "\n" "T" (-1 * $4) "\n" "cx\n" "P" $5 "\n" "L財布\n" "^" >> dateA "_" $6 "_" $3 "_" $2 ".qif"
}'
sed -i -e "1i !Type:Cash" $datename*.qif
