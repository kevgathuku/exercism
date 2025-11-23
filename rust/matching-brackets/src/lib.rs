pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack = Vec::new();

    for element in string.chars() {
        match element {
            '{' | '[' | '(' => stack.push(element),
            ')' => {
                if stack.pop() != Some('(') {
                    return false;
                }
            }
            ']' => {
                if stack.pop() != Some('[') {
                    return false;
                }
            }
            '}' => {
                if stack.pop() != Some('{') {
                    return false;
                }
            }
            _ => (),
        }
    }
    stack.is_empty()
}
