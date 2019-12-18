
function toSnake(beforeChar, currentChar) {
    if (isSeparator(currentChar)) {
        if (isSeparator(beforeChar)) { // 連続するseparatorをひとまとめにする
            return '';
        }
        return '_';
    }

    var lowChar = currentChar.toLowerCase();

    if (isUpperCase(beforeChar)) return lowChar;
    if (isUpperCase(currentChar)) return '_' + lowChar;

    return lowChar;
}

var cliped = str(read(0));
var appended = reduceJoinChar(cliped, toSnake);

copy(appended);
paste();

