# Задание "Hello Turing" (добавить 1 к натуральному числу в двоичной записи)

Код в addition.mt

[Ссылка на эмулятор с загруженным кодом](http://morphett.info/turing/turing.html?8df04fc44d0b0870a282549ddcd98f16)

Определение:

M = ({0, add, halt}, {0, 1}, {0, 1, B}, stages, 0, B, {halt})

| stages | 0          | 1         | B          |
|--------|------------|-----------|------------|
| 0      | (0,\*,R)    | (0,\*,R)   | (1,B,L)    |
| add    | (halt,1,\*)|  (add,0,L) | (halt,1,\*) |
| halt   | -          | -         | -          |

# Задание "Перевернуть строку"

Код в invert.mt

[Ссылка на эмулятор с загруженным кодом](http://morphett.info/turing/turing.html?c37b99650646225b052e2915144db223)

Определение:

M = ({0, find_number, mv0, mv1, find_delimeter, clear, halt}, {0, 1}, {0, 1, B, d, s}, stages, 0, B, {halt})

| stages         | 0                    | 1                    | B                    |                 d | s                    |
|----------------|----------------------|----------------------|----------------------|------------------:|----------------------|
| 0              | (0,\*,R)              | (0,\*,R)              | (find_number,d,L)    |           (0,\*,R) | (0,\*,R)              |
| find_number    | (mv0,s,R)            | (mv1,s,R)            | (clear,\*,R)          | (find_number,\*,L) | (find_number,\*,L)    |
| mv0            | (mv0,\*,R)            | (mv0,\*,R)            | (find_delimeter,0,L) | (mv0,\*,R)         | (mv0,\*,R)            |
| mv1            | (mv1,\*,R)            | (mv1,\*,R)            | (find_delimeter,1,L) | (mv1,\*,R)         | (mv1,\*,R)            |
| find_delimeter | (find_delimeter,\*,L) | (find_delimeter,\*,L) | (find_delimeter,\*,L) | (find_number,\*,L) | (find_delimeter,\*,L) |
| clear          | (clear,B,R)          | (clear,B,R)          | (clear,B,R)          | (halt,B,R)        | (clear,B,R)          |
| halt           | -                    | -                    | -                    | -                 | -                    |

