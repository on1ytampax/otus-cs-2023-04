#include <stdio.h>
#include <string.h>

int main(void)
{
    int min_number = 1;
    int max_number = 1000;
    int counter = 4;
    int number;
    int attempts = 0;
    printf("Загадайте мне число от %d до %d. Я попробую отгадать его за %d попыток.\n", min_number, max_number, counter);
    scanf("%d", &number);

    if (number < min_number || number > max_number) {
        printf("Загаданное число не входит в указанный диапазон.\n");
        return 0;
    }

    int guess = max_number / 2;

    do
    {
        attempts++;
        char response[30];
        char yes[] = "Да";
        char greater[] = "Больше";
        char lower[] = "Меньше";
        printf("Ваше загаданное число это: %d? Попыток осталось: %d\n", guess, counter - 1);
        scanf("%s", response);
        if (strcmp(response, yes) == 0) {
            printf("Ваше число %d угадано. Попыток использовано: %d\n", guess, attempts);
            break;
        }
        if (--counter == 0) {
            printf("Попытки закончились. Я не угадал ваше число, наверное оно было: %d\n", number);
            break;
        }
        if (strcmp(response, greater) == 0) {
            min_number = guess;
        } else if (strcmp(response, lower) == 0) {
            max_number = guess;
        } else {
            printf("Не понял подсказки.\n");
            attempts--;
            counter++;
            continue;
        }
        guess = min_number + (max_number - min_number) / 2;
    } while (counter > 0);
    return 0;
}
