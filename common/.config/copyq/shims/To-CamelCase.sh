current_dir=`dirname $0`

cat $current_dir/../scripts/modules/reduceJoinChar.js \
    $current_dir/../scripts/modules/isSeparator.js \
    $current_dir/../scripts/modules/isUpperCase.js \
    $current_dir/../scripts/toCamelCase.js 

