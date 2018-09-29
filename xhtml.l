(de tag (Tag Attr Prg)
   (prin '< Tag)
   (and Attr
      (for A Attr
         (prin " " (car A) '= '\" (cdr A) '\") ) )
   (prin '>)
   (for H Prg
      (if (atom H)
         (prin H) 
         (eval H) ) )
   (prin '</ Tag '>) )

# Self-closing tag, Ex. <br />
(de sTag (Tag Attr)
   (prin '< Tag) 
   (and Attr
      (for A Attr
         (prin " " (car A) '= '\" (cdr A) '\") ) )
   (prin " " '/>) ) 

(de <. Args #(Tag Attr Close Prg)
   (casq (caddr Args)
      (/> (sTag (car Args) (eval (cadr Args))))
      (> (tag (car Args) (eval (cadr Args)) (cdddr Args))) ) )
