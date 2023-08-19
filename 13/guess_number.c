#include <time.h>
#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    int min_number = 1;
    int max_number = 1000;
    int counter = 10;
    int attempts = 0;

    srand(time(NULL));
    int number = rand() % (max_number + 1 - min_number) + min_number;

    printf("Угадайте число от %d до %d за %d попыток.\n", min_number, max_number, counter);

    do
    {
        attempts++;
        int input_number;
        printf("Введите число. Осталось попыток: %d\n", counter);
        scanf("%d", &input_number);
        if (input_number == number) {
            printf("Да! Число %d угадано. Попыток использовано: %d.\n", number, attempts);
            break;
        }
        if (--counter == 0) {
            printf("Попытки закончились. Было загадано число: %d\n", number);
            break;
        }
        if (input_number < number) {
            printf("Больше\n");
        }
        if (input_number > number) {
            printf("Меньше\n");
        }
 
    } while (counter > 0);
    return 0;
}
