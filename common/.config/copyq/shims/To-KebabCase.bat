rem %~dp0 resolves to the full path of the folder in which the batch script resides.

cat %~dp0\..\script\reduceJoinChar.js `
    %~dp0\..\script\isSeparator.js `
    %~dp0\..\script\isSeparator.js `
    %~dp0\..\script\to-kebab-case.js `
    | copyq eval -

