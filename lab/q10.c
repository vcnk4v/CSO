#include <stdio.h>
#define ll long long int
void direction(ll n, ll *arr, ll *ans);
int main()
{
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    ll ans[n];
    for (ll i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    direction(n, arr, ans);
    for (ll i = 0; i < n; i++)
    {
        printf("%lld ", ans[i]);
    }
    printf("\n");
}