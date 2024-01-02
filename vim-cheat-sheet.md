# Vim Cheat Sheet

## 1. Within Line Navigation
- `w` - Move to the next word.
- `e` - Move to the end of the current word.
- `b` - Move to the beginning of the current word.
- `5[web]` - Move `n` words at a time.
- `a` - Go to insert mode and move the cursor one to the right.

## 2. Repeat Action
- `5i<write whatever to repeat>ESC` - This will repeat whatever you wrote 5 times.

## 3. Find Next Occurrence of a Character
- `fc` - Find the next occurrence of 'c'.
- `Fc` - Find the previous occurrence of 'c'.
- `10fc` - Finds the 10th occurrence of 'c' from the current cursor position.

## 4. Find Matching Parenthesis
- `%` (Shift + 5) - Use to find matching parenthesis.

## 5. Go to Start or End of Line
- `0` - For the beginning of the line.
- `$` - For the end of the line.

## 6. Next Occurrence of Word Under Cursor
- `*` - To find the next occurrence.
- `#` - To find the previous occurrence.

## 7. Go to a Particular Line
- `:20` - Goes to line 20.
- `20G` - Also takes to line 20.

## 8. Search
- `/word-to-search` - Use `n` to go to the next occurrence and `N` for the previous occurrence.

## 9. Insert Mode
- `o` - To go to insert mode where the cursor starts on the next line.
- `O` - For insert mode and the cursor starts on the previous line.

## 10. Delete a Character
- `x` - To delete the character at the cursor.
- `X` - To delete the character before the cursor.

## 11. Edit Current Character Without Going Into Insert Mode
- `r` - Then type your new character.

## 12. Repeat Previous Command
- `.` (dot) - To repeat the last command.

## 13. Select Text
- `v` - Go to visual mode.
- Select words using `e`, then `d` to delete the selected text.

## 14. Delete Current Line and Go to Insert Mode
- `S` (Shift + S)
