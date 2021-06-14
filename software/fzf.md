# FZF

|命令|含义|备注|
|:-:|:-:|:-:|
|`<C-j`>|下一个|:wil:d|
|`<C-n>`||n = next|
|`<Up>`|||
|`<C-k>`|上一个||
|`<C-p>`||p = previous|
|`<Down>`|||
|`<Enter>`|选择||
|`<C-c>`|退出||
|`<C-g>`|||
|`<Esc>`|||

| Token     | Match type                 | Description                          |
| --------- | -------------------------- | ------------------------------------ |
| `sbtrkt`  | fuzzy-match                | Items that match `sbtrkt`            |
| `'wild`   | exact-match (quoted)       | Items that include `wild`            |
| `^music`  | prefix-exact-match         | Items that start with `music`        |
| `.mp3$`   | suffix-exact-match         | Items that end with `.mp3`           |
| `!fire`   | inverse-exact-match        | Items that do not include `fire`     |
| `!^music` | inverse-prefix-exact-match | Items that do not start with `music` |
| `!.mp3$`  | inverse-suffix-exact-match | Items that do not end with `.mp3`    |

