library(hexSticker)
library(nmfspalette)

nmfs_cols <- nmfspalette::nmfs_cols()
img <- file.path(".github/hex/arrows_clapboard.png")
s <- sticker(img,
             package="ghactions4r", p_size=22, p_color = nmfs_cols["darkblue"],
             h_color = nmfs_cols["reflexblue"], h_fill = nmfs_cols["processblue"],
             s_x=1.0, s_y=0.7, s_width=0.5,s_height = 0.55,
             filename="man/figures/ghactions4r_hex.png")
