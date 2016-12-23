#!/usr/bin/bash
#$1のファイルと比較して追加された行を抜き出す。
#
#(使用法)
#./k2gnucash_diff.sh (旧Cashbook) (新Cashbook)
#(説明)
#かけ～ぼのCashbook.csvからGnucashのQIFファイルへのデータ変換を行う。
#前にデータ変換したファイルからの差分だけデータ変換する。

datename="`date +%y%m%d`"
#echo $datename

diff $1 $2 |iconv -f sjis -t utf-8 | awk -F '[,]' '/^> /{gsub(/^> /,"",$0);print}' | sed -e 's/"//g' -e '/^日付/d' | awk -F '[,]' -v "dateA=$datename" '
{
	if ($3 == "支出")
			print "D" $1 "\n" "T" $4 "\n" "cx\n" "P" $5 "\n" "L財布\n" "^" >> dateA "diff_" $6 "_" $3 "_" $2 ".qif"
	else if ($3 == "収入")
			print "D" $1 "\n" "T" (-1 * $4) "\n" "cx\n" "P" $5 "\n" "L財布\n" "^" >> dateA "diff_" $6 "_" $3 "_" $2 ".qif"
}'
sed -i -e "1i !Type:Cash" $datename*.qif

