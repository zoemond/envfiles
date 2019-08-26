
var cliped = str(read(0)).split('\n');

var title = cliped[0].replace(/[|\\`*_{}\[\]()#+\-.!]/g, '\\$&');
var link = cliped[1];

var limk_md = '[' + title + '](' + link + ')';
copy(limk_md);
paste();
