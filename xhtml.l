(de tag (Tag Attr Prg)
   (prin '< Tag)
   (and Attr
      (for A Attr
         (prin " " (car A) '= '\" (cdr A) '\") ) )
   (prin '>)
   (if (atom (car Prg))
      (prin (car Prg))
      (eval Prg) )
   (prin '</ Tag '>) )

# Self-closing tag, Ex. <br />
(de sTag (Tag Attr)
   (prin '< Tag) 
   (and Attr
      (for A Attr
         (prin " " (car A) '= (cdr A)) ) )
   (prin " " '/>) ) 

(de <. (Tag Attr Close . Prg)
   (casq Close
      (/> (sTag Tag Attr))
      (> (tag Tag Attr Prg)) ) )
