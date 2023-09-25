#include <stdio.h>
#define ll long long int
void odd(ll n, ll *arr);
int main()
{
    ll n;
    scanf("%lld", &n);
    ll arr[n];

    for (ll i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    odd(n, arr);
    for (ll i = 0; i < n; i++)
    {
        printf("%lld ", arr[i]);
    }
    printf("\n");
}