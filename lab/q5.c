#include <stdio.h>
#define ll long long int
void *rearrange(ll n, ll *ans);

int main()
{
    ll n;
    scanf("%lld", &n);
    ll ans[n];
    for (ll i = 0; i < n; i++)
    {
        scanf("%lld", &ans[i]);
    }
    rearrange(n, ans);
    for (ll i = 0; i < n; i++)
    {
        printf("%lld ", ans[i]);
    }
    printf("\n");
}