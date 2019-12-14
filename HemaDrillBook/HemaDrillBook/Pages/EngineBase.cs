using HemaDrillBook.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using Microsoft.JSInterop;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace HemaDrillBook.Pages
{
    public class EngineBase : ComponentBase
    {
#nullable disable

        [Inject] protected IJSRuntime JSRuntime { get; set; }
        [Inject] protected ILogger<EngineBase> Logger { get; set; }
        [CascadingParameter] Task<AuthenticationState> AuthenticationState { get; set; }

        //[Inject] SqlServerDataSource RawDataSource { get; set; }
        [Inject] UserManager<ApplicationUser> UserManager { get; set; }

        //protected SqlServerDataSource DataSource { get; set; }
        [Inject] protected NavigationManager Navigation { get; set; }

#nullable restore

        /// <summary>
        /// Gets or sets a value indicating whether this instance is connected.
        /// </summary>
        /// <value><c>true</c> if this instance is connected; <c>false</c> if it is pre-rendering.</value>
        protected bool IsConnected { get; set; }

        protected bool LoadFailed { get; private set; }
        protected string? PageTitle { get; set; }

        protected ApplicationUser? User { get; private set; }
        protected bool IsAuthenticated => User != null;

        protected virtual void AfterRender(bool firstRender)
        {
        }

        protected virtual Task AfterRenderAsync(bool firstRender) => Task.CompletedTask;

        protected sealed override void OnAfterRender(bool firstRender)
        {
            base.OnAfterRender(firstRender);
            try
            {
                AfterRender(firstRender);
            }
            catch (Exception ex)
            {
                LoadFailed = true;
                Logger.LogError(ex, $"Internal error, loading failed during {nameof(AfterRender)}");
            }
        }

        async protected sealed override Task OnAfterRenderAsync(bool firstRender)
        {
            await JSRuntime.InvokeVoidAsync("setTitle", PageTitle);

            await NavigateToElementAsync();

            await base.OnAfterRenderAsync(firstRender);
            try
            {
                await AfterRenderAsync(firstRender);
            }
            catch (Exception ex)
            {
                LoadFailed = true;
                Logger.LogError(ex, $"Internal error, loading failed during {nameof(AfterRenderAsync)}");
            }
        }

        protected virtual Task InitializedAsync() => Task.CompletedTask;

        protected async override sealed Task OnInitializedAsync()
        {
            await base.OnInitializedAsync();
            try
            {
                await JSRuntime.InvokeVoidAsync("isPreRendering");
                IsConnected = true;
            }
            catch (NullReferenceException)
            {
            }

            //Update authentication state
            try
            {
                var authState = await AuthenticationState;
                if (authState.User.Identity.IsAuthenticated)
                {
                    if (User == null)
                    {
                        User = await UserManager.GetUserAsync(authState.User);
                        //DataSource = RawDataSource.WithUser(User);
                    }
                }
                else
                {
                    User = null;
                    //DataSource = RawDataSource;
                }
            }
            catch (Exception ex)
            {
                LoadFailed = true;
                Logger.LogError(ex, $"Internal error, cannot load user information during {nameof(InitializedAsync)}");
            }

            try
            {
                await InitializedAsync();
            }
            catch (Exception ex)
            {
                LoadFailed = true;
                Logger.LogError(ex, $"Internal error, loading failed during {nameof(InitializedAsync)}");
            }
        }

        protected virtual void Initialized()
        {
        }

        protected override sealed void OnInitialized()
        {
            base.OnInitialized();

            try
            {
                Initialized();
            }
            catch (Exception ex)
            {
                LoadFailed = true;
                Logger.LogError(ex, $"Internal error, loading failed during {nameof(Initialized)}");
            }
        }

        protected virtual void ParametersSet()
        {
        }

        protected override sealed void OnParametersSet()
        {
            base.OnParametersSet();

            try
            {
                ParametersSet();
            }
            catch (Exception ex)
            {
                LoadFailed = true;
                Logger.LogError(ex, $"Internal error, loading failed during {nameof(ParametersSet)}");
            }
            base.OnParametersSet();
        }

        protected virtual Task ParametersSetAsync() => Task.CompletedTask;

        protected async sealed override Task OnParametersSetAsync()
        {
            await base.OnParametersSetAsync();
            try
            {
                await ParametersSetAsync();
            }
            catch (Exception ex)
            {
                LoadFailed = true;
                Logger.LogError(ex, $"Internal error, loading failed during {nameof(ParametersSetAsync)}");
            }
        }

        async Task NavigateToElementAsync()
        {
            if (!IsConnected)
                return;

            //ref: https://github.com/aspnet/AspNetCore/issues/8393

            var fragment = new Uri(Navigation.Uri).Fragment;

            if (string.IsNullOrEmpty(fragment))
                return;

            var elementId = fragment.StartsWith("#") ? fragment.Substring(1) : fragment;

            if (string.IsNullOrEmpty(elementId))
                return;

            await JSRuntime.InvokeAsync<bool>("scrollToElementId", elementId);
        }
    }
}
