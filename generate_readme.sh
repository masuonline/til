echo "# til" >README.md
echo "" >>README.md
echo "> Today I Learned" >>README.md
echo "" >>README.md
TIL_COUNT=$(find . -type f -name "*.md" -not -name "README.md" | wc -l) # README.mdはインデックス用のためカウント対象外
echo "${TIL_COUNT##* } TILs and counting..." >>README.md
echo "" >>README.md
echo "---" >>README.md

function file_echo() {
    find $1 -maxdepth 1 -type f -name "*.md" | sort | while read FILE; do
        local FILE2=$(echo "${FILE##*/}" | sed -e "s/\.md//")
        local GITHUB_URL="https://github.com/masuonline/til"
        echo "- [$FILE2]($GITHUB_URL${FILE##*./})" >>README.md
    done
}

# README.mdの特定文章を抽出する関数を作成予定
# function readme_echo() {
# }

function folder_echo() {
    #    find $1 -maxdepth 1 -type d | grep -e "[^.].*" | while read DIR; do
    find $1 -maxdepth 1 -type d | sort | grep -e "[^.].*" | while read DIR; do # ディレクトリをソートするように変更
        if test "$DIR" != "$1"; then
            local MD_FILE_LIST=$(find $DIR -type f -name "*.md")
            if test "$MD_FILE_LIST" == ""; then
                continue
            fi
            local HEADING="##"
            if test $2 != 0; then
                for i in $(seq 1 $2); do
                    HEADING+="#"
                done
            # else
            #     echo "" >>README.md
            fi
            echo "" >>README.md
            echo "$HEADING ${DIR##*/}" >>README.md
            local MD_FILE_LIST3=$(find $DIR -maxdepth 1 -type f -name "*.md")
            if test "$MD_FILE_LIST3" != ""; then
                echo "" >>README.md
                file_echo "$DIR"
            fi
            local MD_FILE_LIST2=$(find $DIR -mindepth 1 -type f -name "*.md")
            if test "$MD_FILE_LIST2" != ""; then
                folder_echo "$DIR" $(expr $2 + 1)
            fi
        fi
    done
}

# index作成関数
function category_echo() {
    #    find $1 -maxdepth 1 -type d | grep -e "[^.].*" | while read DIR; do
    find $1 -maxdepth 1 -type d | sort | grep -e "[^.].*" | while read DIR; do # ディレクトリをソートするように変更
        if test "$DIR" != "$1"; then
            local MD_FILE_LIST=$(find $DIR -type f -name "*.md")
            if test "$MD_FILE_LIST" == ""; then
                continue
            fi
            local HEADING="-"
            if test $2 != 0; then
                for i in $(seq 1 $2); do
                    HEADING="  "$HEADING
                done
            fi
            echo "$HEADING [${DIR##*/}](#${DIR##*/})" >>README.md
            local MD_FILE_LIST2=$(find $DIR -mindepth 1 -type f -name "*.md")
            if test "$MD_FILE_LIST2" != ""; then
                category_echo "$DIR" $(expr $2 + 1)
            fi
        fi
    done
}

echo "" >>README.md
echo "## Categories" >>README.md
echo "" >>README.md

category_echo . 0

echo "" >>README.md
echo "---" >>README.md

folder_echo . 0
