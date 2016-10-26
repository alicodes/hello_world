def allcaps(words)
    if words.length > 10
        words.upcase
    else
        words
    end
    
end
    
puts allcaps("hello world")