context("binomialproportions")    

# Sign ups
successes = c(20, 5, 5)
trials = c(54, 47, 46)
names(successes) = names(trials) = c("Immediate", "After 1 minute", "After 5 minutes")
BinomialProportions(x = successes, n = trials)

# Book title
sends = c(5317, 5341, 5310, 5329)
clicked = c(805, 804, 731, 725)
names(sends) = names(clicked) = c("DIY Market Segmentation [eBook]", "DIY Market Segmentation [Guide]", "How to do Market Segmentation [eBook]", "How to do Market Segmentation [Guide]")
BinomialProportions(x = clicked, n = sends)


BinomialProportions(x = successes[1:2], n = trials[1:2])
    
binom.test(successes[1:2], trials[1:2])
    