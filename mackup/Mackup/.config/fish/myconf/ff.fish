function ff --description 'Like ** but only returns plain files.'
    # This also ignores .git directories.
    find "$argv" -type f \
       -not -name '.git/**' \
       -not -name '.node_modules/**'
end
