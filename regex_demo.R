x <- 'the cat walked down the slippery catwalk'

findAll <- function(pattern, x) {
  
  regmatches(x = x, 
             m = gregexpr(pattern = pattern, 
                          text = x, 
                          perl = T))[[1]]
  
}


# Can use it to simply find 'cat' twice in the string
findAll(pattern = 'cat', x = x)
# ^ Could be useful in very simple cases

# Lets get into special characters


# Dot
# We can match 'cat' followed by any character
findAll(pattern = 'cat.', x = x)

# Brackets
# We can match a character from a set of characters
findAll(pattern = '[abc]', x = x)

# Combining what we have seen so far
findAll(pattern = '[abc].', x = x)

# Within the brackets, you can also define ranges
findAll(pattern = '[a-z]', x = x)

# Caret
# We can negate characters in square brackets
findAll(pattern = '[^abc]', x = x)

# Caret (again) and dollar sign
# Outside of square brackets, we can indicate the beginning of a string
findAll(pattern = '^the ...', x = x)
# ^ Note that if we took out the caret, we would have two matches

# Similarly, we can indicate the end of the string
findAll(pattern = '...walk$', x = x)

# Asterisk and plus sign
# We can match either 0 or more of the previous character
findAll(pattern = 'slip*ery', x = x)

# Similarly, we can match either 1 or more of the previous character
findAll(pattern = 'slip+ery', x = x)

# Note that this can be useful when you have an arbitrary number of repeated characters
# For example, the following will match the whole string
findAll(pattern = '.*', x = x)

# Curly bracket
# We can match between m and n more of the previous character
findAll(pattern = '.{1,3}', x = x)

# Parenthesis and newline
# We can run subexpressions and capture their output
# NOTE: R does not do a great job of this
# One option using base R

