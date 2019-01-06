#!/bin/sh

# 対象年月決定
## 前日の日付を取得
y=`date "+%Y" -d "1 day ago"`
m=`date "+%m" -d "1 day ago"`

## 引数チェック
ym=$1
if [[ $ym != "" ]]; then
    if [[ "$ym" =~ ^[0-9]{6}$ ]]; then
        y=${ym:0:4}
        m=${ym:4:2}
    else
        echo "Invalid parameter format(YYYYMM)."
        exit 1
    fi
fi

# 当月
## 保存ディレクトリ作成
dir="report/$y"
[ ! -e $dir ] && mkdir -p $dir
## SQL実行


# レポート作成
thismonth=`cat report/$y/${y}${m}.txt`
echo -e "$thismonth\n" > "save_result_${y}.txt"

m=`expr $m + 0`
if [ $m -gt 1 ]; then
    # 過去ログ作成
    echo "-------------------------------------------------" >> "save_result_${y}.txt"
    for ((i = 1; i < $m; i++)); do
        month=$(printf '%02d' $i)
        echo "\report\\$y\\$y$month.txt" >> "save_result_${y}.txt"
    done
fi

