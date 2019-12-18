
var clipped = str(read(0)).split('\n');

var title = clipped[0].replace(/[|\\`*_{}\[\]()#+\-.!]/g, '\\$&');
var link = clipped[1];

var link_md = '[' + title + '](' + link + ')';
copy(link_md);
paste();
