
function reduceJoinChar(str, preCurrCharFunc) {
    var appendedStr = ''
    var beforeChar = '';
    for (var i = 0; i < str.length; i++) {
        var currentChar = str.charAt(i);

        var replaced = preCurrCharFunc(beforeChar, currentChar);
        appendedStr = appendedStr + replaced;

        beforeChar = currentChar;
    }
    return appendedStr;
}

