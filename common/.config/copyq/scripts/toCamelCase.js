
function toCamel(beforeChar, currentChar) {
    if (isSeparator(currentChar)) return '';
    if (isSeparator(beforeChar)) return currentChar.toUpperCase();
    return currentChar;
}

var clipped = str(read(0));
var appended = reduceJoinChar(clipped, toCamel);

copy(appended);
paste();
