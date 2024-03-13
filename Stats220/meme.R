library(magick)
library(dplyr)
blank_image <- image_blank(width = 200, height = 300)
blank_image
meme <- image_read("https://tse1-mm.cn.bing.net/th/id/OIP-C.5ptl2rylkcS74UCjL1IGggHaHf?rs=1&pid=ImgDetMain")
meme <- meme %>% image_scale(., "x455") %>% 
  image_append() %>% 
  image_annotate("I'm a lonely man", size = 50,
                 gravity = "southwest", color = "green") 
meme %>% image_write(path = "my_meme.png")


# 2=====
meme <- image_read("https://tse1-mm.cn.bing.net/th/id/OIP-C.5ptl2rylkcS74UCjL1IGggHaHf?rs=1&pid=ImgDetMain")
animation1 <- image_rotate(meme, 90)
animation1 
animation2 <- image_rotate(meme, 60) %>% 
  image_border("red", "20x20")
animation2
animation3 <- image_rotate(meme, 70) 
animation3
animation4 <- meme %>% 
  image_background("blue", flatten = TRUE) %>% 
  image_border("red", "10x10") %>% 
  image_annotate("Frog meme", size = 40,
                 gravity = "southwest", color = "blue",
                 style = "normal",
                 location = "+30+30")
animation <- image_resize(c(animation1,animation2,animation3,animation4),
             '450x450!') |>
  image_background('white') |>
  image_morph() |>
  image_animate(optimize = TRUE) 
animation %>% image_write("my_animation.gif")


