function wallpaper --description "Set the light/dark desktop wallpaper across all spaces"
    if test (count $argv) -eq 0
        echo "usage: wallpaper <light-image> [dark-image]"
        echo
        echo "  wallpaper light.jpg dark.jpg   light + dark variants"
        echo "  wallpaper image.jpg            same image for both modes"
        echo
        echo "any format macos reads (jpg/png/heic). switches with appearance, all spaces."
        return 0
    end
    ~/.config/theme/wallpaper-auto $argv
end
