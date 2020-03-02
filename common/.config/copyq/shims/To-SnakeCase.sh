current_dir=`dirname $0`

cat $current_dir/../scripts/modules/reduceJoinChar.js \
    $current_dir/../scripts/modules/isSeparator.js \
    $current_dir/../scripts/modules/isUpperCase.js \
    $current_dir/../scripts/to_snake_case.js \
    | copyq eval -
