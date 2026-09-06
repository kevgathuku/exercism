/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let digits: Option<Vec<u32>> = code
        .chars()
        .filter(|c| !c.is_whitespace())
        .map(|c| c.to_digit(10))
        .collect();

    let Some(digits) = digits else {
        return false;
    };

    if digits.len() <= 1 {
        return false;
    }

    let sum: u32 = digits
        .iter()
        .rev()
        .enumerate()
        .map(|(idx, &digit)| {
            if idx % 2 == 1 {
                let doubled = digit * 2;

                if doubled > 9 { doubled - 9 } else { doubled }
            } else {
                digit
            }
        })
        .sum();

    sum.is_multiple_of(10)
}
