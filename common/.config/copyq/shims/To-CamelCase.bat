rem %~dp0 resolves to the full path of the folder in which the batch script resides.

cat %~dp0\..\scripts\modules\reduceJoinChar.js ^
    %~dp0\..\scripts\modules\isSeparator.js ^
    %~dp0\..\scripts\modules\isUpperCase.js ^
    %~dp0\..\scripts\toCamelCase.js ^
    | copyq eval -

