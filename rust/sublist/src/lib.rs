#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist(first: &[i32], second: &[i32]) -> Comparison {
    if first == second {
        Comparison::Equal
    } else if first.is_empty() || second.windows(first.len()).any(|win| win == first) { 
        // if second is smaller, the windows iterator is empty and this condition is just skipped
        Comparison::Sublist
    } else if second.is_empty() || first.windows(second.len()).any(|win| win == second) {
        Comparison::Superlist
    } else {
        Comparison::Unequal
    }
}
