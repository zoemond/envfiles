rem %~dp0 resolves to the full path of the folder in which the batch script resides.

cat %~dp0\..\scripts\link_to_markdown.js | copyq eval -
