function ff --description 'Like ** but only returns plain files.'
    # This also ignores .git directories.
    find "$argv" -type f \
       -not -path '*/.git/*' \
       -not -path '*/.node_modules/*'
end
