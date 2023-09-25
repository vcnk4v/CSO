#include <stdio.h>
#define ll long long int
ll photo(ll n, ll *arr, ll k);
int main()
{
    ll n, k;
    scanf("%lld %lld", &n, &k);
    ll arr[2 * n];

    for (ll i = 0; i < 2 * n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    ll ans = photo(2 * n, arr, k);
    if (ans == 1)
    {
        printf("YES\n");
    }
    else
    {
        printf("NO\n");
    }
    return 0;
}
