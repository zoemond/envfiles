
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

function isSeparator(chara) {
	if (chara === '-') return true;
	if (chara === '_') return true;
	if (chara === ' ') return true;
	return false;
}

function toCamel(beforeChar, currentChar){
	if (isSeparator(currentChar)) return '';
	if (isSeparator(beforeChar)) return currentChar.toUpperCase();
	return currentChar;
}

var cliped = str(read(0));
var appended = reduceJoinChar(cliped, toCamel);

copy(appended);
paste();
