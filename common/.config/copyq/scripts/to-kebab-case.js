function toKebab(beforeChar, currentChar) {
    if (isSeparator(currentChar)) {
        if (isSeparator(beforeChar)) { // 連続するseparatorをひとまとめにする
            return '';
        }
        return '-';
    }

    var lowChar = currentChar.toLowerCase();

    if (isUpperCase(currentChar)) {
        if (isUpperCase(beforeChar)) {// 連続する大文字は'_'で連結しない
            return lowChar;
        } else {
            return '-' + lowChar;
        }
    }
    return lowChar;
}

var clipped = str(read(0));
var appended = reduceJoinChar(clipped, toKebab);

copy(appended);
paste();
