// google ドキュメント、スプレッドシート が無理になるので
settings.blacklistPattern = /.*docs.google.com.*/i;
settings.blocklist = {
  "https://docs.google.com": 1,
};
api.unmapAllExcept([], /docs.google.com|twitter.com/);

api.map("h", "S");
api.map("l", "D");

settings.hintShiftNonActive = true;

settings.prevLinkRegex = /((<<|prev(ious)?)|<|‹|«|←|前へ|前のページ+)/i;
settings.nextLinkRegex = /((>>|next)|>|›|»|→|次へ|次のページ+)/i;
// Google jp 1年以内
api.addSearchAlias(
  "1",
  "Google jp 1年以内",
  "https://www.google.co.jp/search?q={0}&tbs=qdr:y,lr:lang_1ja&lr=lang_ja"
);
api.mapkey("o1", "#8Open Search with alias 1", function () {
  api.Front.openOmnibar({ type: "SearchEngine", extra: "1" });
});

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
