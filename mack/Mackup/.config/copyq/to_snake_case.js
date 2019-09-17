
function reduceJoinChar(str, preCurrCharFunc) {
	var appendedStr = ''
	var beforeChar = '';
	for (var i = 0; i < str.length; i ++) {
		var currentChar = str.charAt(i); 

		var replaced = preCurrCharFunc(beforeChar, currentChar);
		appendedStr = appendedStr + replaced;

		beforeChar = currentChar;
	}
	return appendedStr;
}

function isUpperCase(chara) {
	return chara === chara.toUpperCase();
}

function isSeparator(chara) {
	if (chara === '-') return true;
	if (chara === '_') return true;
	if (chara === ' ') return true;
	return false;
}

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

