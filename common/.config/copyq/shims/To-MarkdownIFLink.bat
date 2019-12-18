rem %~dp0 resolves to the full path of the folder in which the batch script resides.

cat %~dp0\..\script\link_to_commit-message.js | copyq eval -
