use std::collections::HashSet;

/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    let alphabet: HashSet<char> = ('a'..='z').collect();
    let sentence_set: HashSet<char> = sentence.to_lowercase().chars().collect();
    alphabet.is_subset(&sentence_set) 
}
