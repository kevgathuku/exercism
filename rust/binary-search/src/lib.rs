use std::cmp::Ordering;

pub fn find(array: &[i32], key: i32) -> Option<usize> {
    let mut low = 0;
    let mut high = array.len();

    while low < high {
        let middle = low + (high - low) / 2;
        let current = array.get(middle)?;
        match current.cmp(&key) {
            Ordering::Equal => return Some(middle),
            Ordering::Less => low = middle + 1,
            Ordering::Greater => high = middle,
        }
    }

    None
}
